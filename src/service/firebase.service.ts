import { Injectable } from '@nestjs/common';
import { Firebase } from 'src/firebase/firebase';

@Injectable()
export class FirebaseService {
  constructor(
  ) {}
  async criarUsuarioFirebase(email, senha) {
    return await Firebase.criarUsuarioFirebase(email, senha)
  }
  async loginFirebase(email, password) {
    return await Firebase.signInWithEmailAndPassword(email, password)
  }
  async emailVerificacao(email, password) {
    return await Firebase.emailVerificacao(email, password)
  }
  async sendPasswordResetEmail(email){
    return await Firebase.sendPasswordResetEmail(email)
  }
  
}
