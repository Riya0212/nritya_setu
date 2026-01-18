import { onCall, HttpsError } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import { apiResponse } from '../utils/responseHelper';

export const resolveUsername = onCall(
    async (request) => {

        const { username } = request.data;

        if (!username) {
            throw new HttpsError(
                'invalid-argument',
                'Username is required'
            );
        }

        const doc = await admin
            .firestore()
            .collection('users')
            .doc(username)
            .get();

        if (!doc.exists || !doc.data()?.is_active) {
            throw new HttpsError(
                'not-found',
                'Invalid username'
            );
        }

        return apiResponse(
            true,
            { email: doc.data()?.email },
            'Username resolved'
        );
    }
);
