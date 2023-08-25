import { AppController } from './app.controller';
import {
  MiddlewareConsumer,
  Module,
  NestModule,
  RequestMethod,
} from '@nestjs/common';
import { AuthModule } from './modules/auth.module';
import { UsersModule } from './modules/users.module';

import { FirebaseModule } from './modules/firebase.module';
import { FirebaseService } from './service/firebase.service';
import { PreAuthMiddleware } from './auth/firebase/preauth.middleware';

@Module({
  imports: [
    AuthModule,
    UsersModule,

    FirebaseModule,
  ],
  controllers: [AppController],
  providers: [FirebaseService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer): any {
    consumer
      .apply(PreAuthMiddleware).forRoutes({
        path: '/*',
        method: RequestMethod.ALL,
      });
  }
}
