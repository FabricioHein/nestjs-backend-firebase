import { PrismaService } from 'src/base/relacional/PrismaService';
import { Injectable } from '@nestjs/common';


@Injectable()
export class UsuarioRepository {
  constructor(private prisma: PrismaService) {}
  async getUserAll(clienteId) {
    return await this.prisma.users.findMany({
      where:{
        clienteId: clienteId

      },
      select: {
        id: true,
        name: true,
        cpf: true,
        email: true,
        isAdmin: true,
        sobrenome: true,
        sexoId: true,
        telefone: true,
          

      },
    });
  }
  async getByIdUser(id) {
    return await this.prisma.users.findFirst({
      where: {
        id: id,
      },
    });
  }
  async getByEmailUser(email) {
    return await this.prisma.users.findFirst({
      where: {
        email: email,
      },
    });
  }
  async createUser(data) {
    return await this.prisma.users.create({
      data: data,
    });
  }

  async updateUser(id, data) {
    return await this.prisma.users.update({
      where: {
        id: id,
      },
      data: data,
    });
  }

  async deleteUser(id) {
    return await this.prisma.users.delete({
      where: {
        id: id,
      },
    });
  }
}
