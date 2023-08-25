import { Injectable, NotAcceptableException } from '@nestjs/common';

import { UsuarioRepository } from 'src/repositories/usuario.repository';
import { FirebaseService } from './firebase.service';

@Injectable()
export class UsuariosService {
  constructor(
    private usuarioRepositorio: UsuarioRepository,

    private firebaseService: FirebaseService,
  
  ) {}
  async novaSenhaUsuarioEmail(email) {
    try {
      const usuario = await this.usuarioRepositorio.getByEmailUser(email);
      if (usuario) {
        return await this.firebaseService.sendPasswordResetEmail(email);
      }
    } catch (error) {
      return error;
    }
  }

  async atualizarUsuario(data: any) {
    try {
      const { id } = data;
      const dataUsuario = data;
      return await this.usuarioRepositorio.updateUser(Number(id), dataUsuario);
    } catch (error) {
      return error;
    }
  }
  async getAllUsuario(id) {
    try {
      return await this.usuarioRepositorio.getUserAll(Number(id));
    } catch (error) {
      return error;
    }
  }

  async deleteUsuario(data: any) {
    try {
      const id = data.id;
      return await this.usuarioRepositorio.deleteUser(id);
    } catch (error) {
      return error;
    }
  }
  async salvarFotoPerfil(data: any) {
    try {
      // return 'ok';
    } catch (error) {
      return error;
    }
  }


}
