import { Controller, Request, Get, Post, Param } from '@nestjs/common';
import { UsuariosService } from '../service/usuarios.service';


@Controller('authenticator')
export class AuthenticatorController {
  constructor(
    private readonly usuariosService: UsuariosService,
    ) {}


  @Get('novasenha/:email')
  async novaSenhaUsuarioEmail(@Param('email') email) {
    try {
      return await this.usuariosService.novaSenhaUsuarioEmail(email);
    } catch (error) {
      return error;
    }
  }  

  
}
