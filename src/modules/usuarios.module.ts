import { Module } from '@nestjs/common';
import { UsuariosService } from '../service/usuarios.service';
import { UsuariosController } from '../controllers/usuarios.controller';
import { UsuarioRepository } from 'src/repositories/usuario.repository';
import { PrismaService } from 'src/base/relacional/PrismaService';

import { FirebaseService } from 'src/service/firebase.service';


@Module({
  controllers: [UsuariosController],
  providers: [
    FirebaseService,
    UsuariosService,
    UsuarioRepository,
    PrismaService,


  ],
})
export class UsuariosModule {}
