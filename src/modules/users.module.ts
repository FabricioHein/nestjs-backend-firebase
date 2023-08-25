import { Module } from '@nestjs/common';
import { PrismaService } from 'src/base/relacional/PrismaService';
import { UsersService } from '../service/users.service';
import { UsuarioRepository } from 'src/repositories/usuario.repository';

@Module({
  providers: [UsersService, PrismaService, UsuarioRepository],
  exports: [UsersService],
})
export class UsersModule {}