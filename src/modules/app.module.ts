import { AppController } from '../controllers/app.controller';
import { FirebaseService} from '../service/firebase.service';
import { PreAuthMiddleware } from '../auth/firebase/preauth.middleware';


import {
  
  MiddlewareConsumer,
  Module,
  NestModule,
  RequestMethod,
} from '@nestjs/common';


@Module({
  imports: [
 
  ],
  controllers: [AppController],
  providers: [FirebaseService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer): any {
    consumer
      .apply(PreAuthMiddleware).forRoutes({
        path: '/crm/*',
        method: RequestMethod.ALL,
      });
  }
}
