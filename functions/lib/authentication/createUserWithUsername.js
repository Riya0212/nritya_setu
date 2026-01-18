"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.createUserWithUsername = void 0;
const https_1 = require("firebase-functions/v2/https");
const admin = __importStar(require("firebase-admin"));
const responseHelper_1 = require("../utils/responseHelper");
exports.createUserWithUsername = (0, https_1.onCall)(async (request) => {
    const auth = request.auth;
    const data = request.data;
    // 🔐 Admin guard
    if (!auth ||
        !Array.isArray(auth.token?.roles) ||
        !auth.token.roles.includes('admin')) {
        throw new https_1.HttpsError('permission-denied', 'Only admin can create users');
    }
    const { username, password, handle, academy_code, roles = ['student'], } = data;
    if (!username || !password || !academy_code) {
        throw new https_1.HttpsError('invalid-argument', 'Missing required fields');
    }
    const email = `${username}@nrityasetu.app`;
    // 🔍 Username uniqueness
    const usernameDoc = await admin
        .firestore()
        .collection('users')
        .doc(username)
        .get();
    if (usernameDoc.exists) {
        throw new https_1.HttpsError('already-exists', 'Username already exists');
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
    return (0, responseHelper_1.apiResponse)(true, { uid: userRecord.uid }, 'User created successfully');
});
