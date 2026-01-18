import { onCall, HttpsError } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import { apiResponse } from '../utils/responseHelper';

export const createUserWithUsername = onCall(
    async (request) => {

        const auth = request.auth;
        const data = request.data;

        // 🔐 Admin guard
        if (
            !auth ||
            !Array.isArray(auth.token?.roles) ||
            !auth.token.roles.includes('admin')
        ) {
            throw new HttpsError(
                'permission-denied',
                'Only admin can create users'
            );
        }

        const {
            username,
            password,
            handle,
            academy_code,
            roles = ['student'],
        } = data;

        if (!username || !password || !academy_code) {
            throw new HttpsError(
                'invalid-argument',
                'Missing required fields'
            );
        }

        const email = `${username}@nrityasetu.app`;

        // 🔍 Username uniqueness
        const usernameDoc = await admin
            .firestore()
            .collection('users')
            .doc(username)
            .get();

        if (usernameDoc.exists) {
            throw new HttpsError(
                'already-exists',
                'Username already exists'
            );
        }

        // 👤 Create Auth user
        const userRecord = await admin.auth().createUser({
            email,
            password,
            displayName: handle ?? username,
        });

        // 🏷 Custom claims
        await admin.auth().setCustomUserClaims(userRecord.uid, {
            roles,
            academy_code,
        });

        // 🗂 Firestore profile
        await admin.firestore()
            .collection('users')
            .doc(username)
            .set({
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

        // ✅ STANDARD RESPONSE
        return apiResponse(
            true,
            { uid: userRecord.uid },
            'User created successfully'
        );
    }
);
