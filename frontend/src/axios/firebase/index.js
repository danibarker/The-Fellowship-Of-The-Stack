// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {
  getStorage,
  ref,
  uploadBytes,
  connectStorageEmulator,
  getDownloadURL
} from "firebase/storage";

const firebaseConfig = {
  apiKey: "AIzaSyBGst9KRoCQra_SzP7jSyiSImHhgTpd3hY",
  authDomain: "versa-yyc.firebaseapp.com",
  projectId: "versa-yyc",
  storageBucket: "versa-yyc.appspot.com",
  messagingSenderId: "294533216256",
  appId: "1:294533216256:web:6f936528f60be41e7540e5"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const storage = getStorage(app);
connectStorageEmulator(storage, "localhost", 9199);

// const imageRef = ref(storage, "images");
const uploadImage = async (image) => {
  const imageRef = ref(storage, `images/${image.filename}`);
  await uploadBytes(imageRef, image);
  const url = await getDownloadURL(imageRef);
  return url;
};

export default uploadImage;
