const functions = require('firebase-functions');
const fetch = require('node-fetch');
const cors = require('cors')({origin: true});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.humanbase = functions.https.onRequest((req, res) => {
  cors(req, res, () => {});
  fetch(`https://hb.flatironinstitute.org/api/genes/${req.query.id}/predictions/`).then((response) => {
    return response.json();
    })
    .then((myJson) => {
      res.send(myJson);
    });
  
});
