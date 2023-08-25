import {
  Controller,
  Post,
  Get,
  Put,
  Param,
  Request,
} from '@nestjs/common';
import { UsuariosService } from '../service/usuarios.service';

@Controller('crm/usuario')
export class UsuariosController {
  constructor(
    private readonly usuariosService: UsuariosService,
  ) {}
  @Post('criar-usuario-cliente')
 
  @Get('todos/:clienteId')
  async getAllUsuario(@Param('clienteId') clienteId) {
    try {
      return await this.usuariosService.getAllUsuario(clienteId);
    } catch (error) {
      return error;
    }
  }
  @Get('novasenha/:email')
  async novaSenhaUsuarioEmail(@Param('email') email) {
    try {
      return await this.usuariosService.novaSenhaUsuarioEmail(email);
    } catch (error) {
      return error;
    }
  }  
  @Post('delete')
  async deleteUsuario(@Request() req) {
    try {
      return await this.usuariosService.deleteUsuario(req.body);
    } catch (error) {
      return error;
    }
  }
  
  @Post('foto/perfil')
  async salvarFotoPerfil(@Request() req) {
    try {
      return await this.usuariosService.salvarFotoPerfil(req.body);
    } catch (error) {
      return error;
    }
  }
  
  
  
 
  
  @Put()
  async atualizarUsuario(@Request() req) {
    try {
      return await this.usuariosService.atualizarUsuario(req.body);
    } catch (error) {
      return error;
    }
  }
}
