// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyC8S0Lnn5-E-B5Vo5D_hZTDX4Qdjqhj-jc",
  authDomain: "furiafanhub.firebaseapp.com",
  projectId: "furiafanhub",
  storageBucket: "furiafanhub.firebasestorage.app",
  messagingSenderId: "1051892429625",
  appId: "1:1051892429625:web:d5355de810bf2323c06ee8",
  measurementId: "G-N9TZZ4HE7L"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);