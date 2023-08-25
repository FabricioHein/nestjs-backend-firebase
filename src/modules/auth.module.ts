import { Module } from '@nestjs/common';
import { AuthService } from '../service/auth.service';

import { UsersModule } from './users.module';
import { PassportModule } from '@nestjs/passport';

import { FirebaseModule } from './firebase.module';
import { FirebaseService } from 'src/service/firebase.service';
import { AuthenticatorModule } from './authenticator.module';


@Module({
  imports: [
    UsersModule,
    PassportModule,
    AuthenticatorModule,
 
  ],
  providers: [AuthService, FirebaseService],
  exports: [AuthService],
})
export class AuthModule {}
