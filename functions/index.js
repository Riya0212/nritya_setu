const {onCall} = require("firebase-functions/v2/https");
const admin = require("firebase-admin");

admin.initializeApp();

exports.resolveUsername = onCall(async (request) => {
  const data = request.data || {};
  const username = data.username;

  if (!username || username.indexOf(".") === -1) {
    throw new Error("Invalid username");
  }

  return {
    email: "test@nrityasetu.app"
  };
});
