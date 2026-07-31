import { onRequest } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import { apiResponse } from '../utils/responseHelper';

export const createUserWithUsernameHttp = onRequest(
  async (req, res): Promise<void> => {
    try {
      if (req.headers['x-admin-secret'] !== 'local-admin') {
        res.status(403).json(
          apiResponse(false, [], 'Unauthorized')
        );
        return;
      }

      const {
        username,
        password,
        handle,
        academy_code,
        roles = ['student'],
      } = req.body;

      if (!username || !password || !academy_code) {
        res.status(400).json(
          apiResponse(false, [], 'Missing required fields')
        );
        return;
      }

      const email = `${username}@nrityasetu.app`;

      const userDoc = await admin.firestore()
        .collection('users')
        .doc(username)
        .get();

      if (userDoc.exists) {
        res.status(409).json(
          apiResponse(false, [], 'Username already exists')
        );
        return;
      }

      const userRecord = await admin.auth().createUser({
        email,
        password,
        displayName: handle ?? username,
      });

      await admin.auth().setCustomUserClaims(userRecord.uid, {
        roles,
        academy_code,
      });

      await admin.firestore().collection('users').doc(username).set({
        id: username,
        username,
        handle: handle ?? username,
        email,
        academy_code,
        role: roles,
        is_active: true,
        created_at: admin.firestore.FieldValue.serverTimestamp(),
        updated_at: admin.firestore.FieldValue.serverTimestamp(),
      });

      res.json(
        apiResponse(true, { uid: userRecord.uid }, 'User created successfully')
      );
      return;

    } catch (e: any) {
      res.status(500).json(
        apiResponse(false, [], e.message)
      );
      return;
    }
  }
);
