import * as admin from 'firebase-admin';

if (process.env.FUNCTIONS_EMULATOR) {
  admin.initializeApp({
    projectId: "nrityasetu", // your project ID
  });
} else {
  admin.initializeApp(); // normal prod
}

// 🔐 Auth functions
export { createUserWithUsername } from './authentication/createUserWithUsername';
export { createUserWithUsernameHttp } from './authentication/createUserWithUsername.http';
