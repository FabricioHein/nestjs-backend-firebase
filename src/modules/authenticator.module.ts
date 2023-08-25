import { Module } from '@nestjs/common';
import { AuthenticatorController } from '../controllers/authenticator.controller';
import { UsuariosService } from 'src/service/usuarios.service';
import { UsuarioRepository } from 'src/repositories/usuario.repository';

import { FirebaseService } from 'src/service/firebase.service';

import { PrismaService } from 'src/base/relacional/PrismaService';

@Module({
  controllers: [AuthenticatorController],
  providers: [
    UsuariosService,
    UsuarioRepository,
   
    FirebaseService,
 
    PrismaService,
  ],
})
export class AuthenticatorModule {}
