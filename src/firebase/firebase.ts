'use strict';
import { initializeApp } from 'firebase/app';
import firebaseConfig from './config';
import {
  getAuth,
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  sendPasswordResetEmail,
  sendEmailVerification,
  updatePassword,
} from 'firebase/auth';

initializeApp(firebaseConfig);

// Initialize Cloud Storage and get a reference to the service

export class Firebase {
  //realizar o login
  static async signInWithEmailAndPassword(email, password) {
    const auth = getAuth();
    const login = await signInWithEmailAndPassword(auth, email, password);

    if (login) {
      return login;
    }
    return null;
  }
  static async sendPasswordResetEmail(email) {
    const auth = getAuth();
    const senhaNova = await sendPasswordResetEmail(auth, email)
      .then(() => {
        console.log('Senha Enviado para o Email!');
        // Password reset email sent!
        return true;
      })
      .catch(error => {
        return error;
      });
    return senhaNova;
  }
  static getPassword() {
    return Math.floor(1000000000 + Math.random() * 900000).toString();
  }
  static async criarUsuarioFirebase(email, senha) {
    const auth = getAuth();

    const criarUsuario = await createUserWithEmailAndPassword(
      auth,
      email,
      senha,
    )
      .then(data => data)
      .catch(e => e);

    if (criarUsuario.code !== 'auth/email-already-in-use') {
      await this.emailVerificacao(email, senha);
      return true;
    } else {
      return false;
    }
  }
  static updatePassword(user, newPassword) {
    // const user = auth.currentUser;
    // updatePassword(user, newPassword).then(() => {
    //   // Update successful.
    // }).catch((error) => {
    //   // An error ocurred
    //   // ...
    // });
  }
  static updateEmail() {
    //     const auth = getAuth();
    // updateEmail(auth.currentUser, "user@example.com").then(() => {
    //   // Email updated!
    //   // ...
    // }).catch((error) => {
    //   // An error occurred
    //   // ...
    // });
  }
  static async emailVerificacao(email, password) {
    const auth = getAuth();
    await signInWithEmailAndPassword(auth, email, password);
    sendEmailVerification(auth.currentUser).then(() => {
      console.log(' Email verification sent!');
      // Email verification sent!
      // ...
    });
    return true;
  }
  static async usuariaExiste(email, password) {
    const auth = getAuth();
  }
}
