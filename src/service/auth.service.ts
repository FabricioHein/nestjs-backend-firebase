import { Injectable } from '@nestjs/common';
import { UsersService } from './users.service';

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
  ) {}

  async loginAcesso(firebaseUsuario: any) {
    const usuario = await this.usersService.findOne(firebaseUsuario.email);
    const token = firebaseUsuario.accessToken || null;
    if (usuario) {
      
      return usuario;
    }
    return null;
  }
}
