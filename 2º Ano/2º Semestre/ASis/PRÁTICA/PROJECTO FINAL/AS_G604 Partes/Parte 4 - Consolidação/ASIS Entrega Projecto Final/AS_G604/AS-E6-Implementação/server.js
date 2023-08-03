// Import utilities
const morgan = require('morgan');
const express = require('express');
const firebase = require('firebase/auth');
const firebaseapp = require('firebase/app')
const firebaseConfig = {
    apiKey: "AIzaSyDMNFYrgOPJNPfGWYia8nSIgsPatNReRco",
    authDomain: "as-artdesign.firebaseapp.com",
    projectId: "as-artdesign",
    storageBucket: "as-artdesign.appspot.com",
    messagingSenderId: "372641774079",
    appId: "1:372641774079:web:1d882411517f641efccfca",
    measurementId: "G-YBCH90HXHR"
  };

var alert = require('alert');

var bodyParser = require('body-parser')

var firebaseApp = firebaseapp.initializeApp(firebaseConfig);

// Create app
var app = express();

var configData = require('./views/designs.json');

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({  extended: true
}))

// parse application/json
app.use(bodyParser.json())

const auth = firebase.getAuth(firebaseApp);

// Middleware
app.set('view engine', 'ejs');


app 
    .use(express.static('views'))
    .use(morgan('dev'))
    .use(express.json())

// Listen to requests
app.listen(process.env.PORT || 5000, '0.0.0.0')
console.log(`Listening on port 5000`)

// Routes
app.get('/', (req, res) => {

    res.render('index', { session: req.session, designs: configData.designs });

},

app.post('/register', async(req, res) => {

    try {
        const {username, email, password} = req.body;
        await firebase.createUserWithEmailAndPassword(auth, email, password).then((userCredential) => {
            // Signed in
            var user = userCredential.user;
            console.log(user);
        }).catch((error) => {
            var errorCode = error.code;
            var errorMessage = error.message;
            console.log(error);
            res.redirect('Register.html')
            alert(error.code)
        });
        res.redirect('Login.html');
        
    } catch(e) {
        
    }
}),

app.post('/login', async(req, res) => {

    try {
        const {username, email, password} = req.body;
        console.log(req.body)
        await firebase.signInWithEmailAndPassword(auth, email, password).then((userCredential) => {
            // Signed in
            var user = userCredential.user;
            console.log(user);
        }).catch((error) => {
            var errorCode = error.code;
            var errorMessage = error.message;
            console.log(error);
            res.redirect('Login.html')
            alert(error.code)
        });
        res.redirect('/');
        
    } catch(e) {
        
    }
}))
