import {
  Controller,
  Request,
  Post,
  UnauthorizedException,
} from '@nestjs/common';
import { AuthService } from '../service/auth.service';
import { FirebaseService } from '../service/firebase.service';

@Controller()
export class AppController {
  constructor(
    private authService: AuthService,
    private firebaseService: FirebaseService,
  ) {}

  @Post('auth/login')
  async login(@Request() req) {
    const { username, password } = req.body;
    const loginFirebase = await this.firebaseService.loginFirebase(
      username,
      password,
    );
    if (loginFirebase.user.emailVerified && loginFirebase.user.uid) {
      const usuarioAcesso = await this.authService.loginAcesso(
        loginFirebase.user,
      );
      if (usuarioAcesso) {
        return usuarioAcesso;
      }
      throw new UnauthorizedException();
    } else if (!loginFirebase.user.emailVerified) {
      return {
        msg: 'Verifique o seu email para poder acessar',
        error: 'error'
      }
    }
    throw new UnauthorizedException();
  }
}
