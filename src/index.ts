import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import { AppModule } from './app.module';
import * as functions from 'firebase-functions';
import * as express from 'express';

const server = express();

export const createNestServer = async expressInstance => {
  const app = await NestFactory.create(
    AppModule,
    new ExpressAdapter(expressInstance),
  );

  return app.init();
};

createNestServer(server)
  // tslint:disable-next-line:no-console
  .then(v => console.log('Nest Ready'))
  // tslint:disable-next-line:no-console
  .catch(err => console.error('Nest broken', err));

export const api = functions.https.onRequest(server);

// export const scheduleEmail = functions.pubsub
//   .schedule('every 5 minutes')
//   .onRun(async context => {
//     EmailService.executar();

//     console.log('This will be run every 5 minutes!');
//   });

  // export const scheduleAtividadesTask = functions.pubsub
  // .schedule('every 5 minutes')
  // .onRun(async context => {
  //   EmailService.executar();

  //   console.log('This will be run every 5 minutes!');
  // });
