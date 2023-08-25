'use strict';
import { initializeApp } from 'firebase/app';
import firebaseConfig from '../firebase/config';
import {
  getStorage,
  ref,
  getDownloadURL,
  uploadBytesResumable,
} from 'firebase/storage';

const { Readable } = require('stream');
// const admin = require("firebase-admin");
const mkdirp = require('mkdirp');
const fs = require('fs');
const os = require('os');
const path = require('path');

console.log(firebaseConfig)
initializeApp(firebaseConfig);
// Initialize Cloud Storage and get a reference to the service
const storage = getStorage();

export class FileHelper {
  static bufferToStream(binary) {
    const readableInstanceStream = new Readable({
      read() {
        this.push(binary);
        this.push(null);
      },
    });

    return readableInstanceStream;
  }

  static base64ToBuffer(fileBase64) {
    return Buffer.from(fileBase64, 'base64');
  }
  static async gravarFileStorage(bufferFile, clienteId, fileName) {
    const metadata = {
      contentType: bufferFile.mimetype,
    };
    const storageRef = ref(storage, `files/cliente/${clienteId}/${fileName}`);
    // / Upload the file in the bucket storage
    const snapshot = await uploadBytesResumable(
      storageRef,
      bufferFile.buffer,
      metadata,
    );
    // Grab the public url
    const downloadURL = await getDownloadURL(snapshot.ref);

    console.log('File successfully uploaded.');

    return {
      message: 'file uploaded to firebase storage',
      name: 'file.originalname',
      type: 'file.mimetype',
      downloadURL: downloadURL,
    };
  }
  static salvarArquivoTemp(data, nome) {
    const localPath = path.join(os.tmpdir(), nome);
    fs.writeFileSync(localPath, JSON.stringify(data));
    return localPath;
  }

  static salvarBufferTemp(data, nome) {
    const localPath = path.join(os.tmpdir(), nome);
    fs.writeFileSync(localPath, data);
    return localPath;
  }

  /**
   * Converte um csv para json.
   * @param {String} file
   * @param {String} separator
   */
  static convertCsvToJson(file, separator, hasHeader) {
    const linhas = file.split('\n').filter(p => (p || '').length > 0);

    let headers = [];
    let registros = [];

    linhas.forEach((dados, index) => {
      dados = dados.trim();
      if (index === 0 && hasHeader) {
        headers = dados.split(separator);
      } else {
        registros.push(dados.split(separator));
      }
    }, this);

    return {
      headers,
      registros,
      json: registros.map(p => {
        let retorno = {};

        headers.forEach((header, index) => {
          retorno[header] = p[index];
        });

        return retorno;
      }),
    };
  }
}
