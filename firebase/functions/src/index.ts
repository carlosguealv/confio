/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { messaging } from 'firebase-admin';

// This method initializes the SDK so that it can be used later in the code.
admin.initializeApp();

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

    // Prepare objects to store user tokens and their respective notification data
    const userFromTokens: {[k: string]: any} = {};
    const userToTokens: {[k: string]: any} = {};

    // Process each document from the 'payments' collection
    querySnapshot.forEach(async (doc) => {
        const userToSnapshot = await db.collection('users').doc(doc.data().userTo).get();
        const userFromSnapshot = await db.collection('users').doc(doc.data().userFrom).get();

        if (userFromSnapshot.exists && userToSnapshot.exists) {
            const userToData = userToSnapshot.data();
            const userFromData = userFromSnapshot.data();

            // Construct notification messages and collect tokens for 'To' users
            if (userToData?.token) {
                userToTokens[userToData.token] = {
                    notification: {
                        title: 'Payment Reminder',
                        body: 'You have a bill due.',
                        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                    },
                };
            }

            // Construct notification messages and collect tokens for 'From' users
            if (userFromData?.token) {
                userFromTokens[userFromData.token] = {
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
            }
        }
    });

    // Convert the token maps to arrays of messages
    const messagesTo = Object.entries(userToTokens).map(([token, message]) => ({...message, token}));
    const messagesFrom = Object.entries(userFromTokens).map(([token, message]) => ({...message, token}));

    // Send the notifications to the respective users
    try {
        // Send notifications to 'To' users
        const responseTo = await messaging().sendAll(messagesTo);
        console.log(`${responseTo.successCount} notifications sent successfully to 'To' users`);

        // Send notifications to 'From' users
        const responseFrom = await messaging().sendAll(messagesFrom);
        console.log(`${responseFrom.successCount} notifications sent successfully to 'From' users`);
    } catch (error) {
        console.error('Error sending notifications:', error);
    }
});