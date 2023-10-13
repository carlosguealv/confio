/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import * as functions from "firebase-functions";
import { firestore } from "firebase-admin";
import * as admin from "firebase-admin";
// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Firebase Cloud Function to read the 'payments' collection for documents with the 'due' field (Timestamp type) and then send a notification using Firebase Cloud Messaging
// when the 'due' field is equal to the current date.
// This function is triggered every day at 8:00 AM UTC.

export const sendNotification = functions.pubsub.schedule('0 8 * * *').onRun(async (context) => {
    const date = new Date();
    const db = admin.firestore();
    const querySnapshot = await db.collection('payments').where('due', '==', date).get();
    const userFromTokens: {[k: string]: any} = {};
    const userToTokens: {[k: string]: any} = {};
    querySnapshot.forEach(async (doc) => {
        const userToSnapshot = await db.collection('users').doc(doc.data().userTo).get();
        const userFromSnapshot = await db.collection('users').doc(doc.data().userFrom).get();
        if (userFromSnapshot.exists && userToSnapshot.exists) {
            const userToData = userToSnapshot.data();
            const userFromData = userFromSnapshot.data();
            if (userToData) {
                userToTokens[userToData.token as string] = {
                    'notification': {
                        title: 'Payment Reminder',
                        body: 'You have a bill .',
                        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                    },
                };
                userToTokens[userToData.token].push(userToSnapshot.data()?.token);
            }
            if (userFromData) {
                userFromTokens[userFromData.token as string] = {
                    notification: {
                        title: 'Payment Reminder',
                        body: 'Please pay your bill.',
                        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                    },
                    data: {
                        click_action: 'FLUTTER_NOTIFICATION_CLICK',
                        message: 'Please pay your bill.',
                    },
                };
                userFromTokens[userFromSnapshot.data()?.token].push(userFromSnapshot.data()?.token);
            }
        }
    });
    // TODO: send notification to userToTokens and userFromTokens
    // await admin.messaging().sendToDevice(Object.keys(userToTokens), payload);
    // await admin.messaging().sendToDevice(Object.keys(userFromTokens), payload);
    // build the FCM notification payload
    // await admin.messaging().()

    });