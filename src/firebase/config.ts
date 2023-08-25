const firebaseConfig = {
  apiKey: process.env.API_KEY,
  authDomain: process.env.AUTH_DOMAIN,
  projectId: process.env.PROJECT_ID,
  databaseURL: process.env.FIRESTORE_DB_URL,
  storageBucket: process.env.STORAGE_BUCKET,
  messagingSenderId: process.env.MESSAGING_SENDER_ID,
  appId: process.env.APP_ID,
  measurementId: process.env.MEASUREMENT_ID,
  privateKey: process.env.PRIVATE_KEY ? process.env.PRIVATE_KEY.replace(/\n/gm, "\n")
  : undefined,
  clientEmail: process.env.CLIENTE_EMAIL,
};

export default firebaseConfig;
