/* eslint-disable no-alert */
/* eslint-disable no-param-reassign */
import Axios from "axios";

export const axiosLogin = async (email, password) => {
  const res = await Axios.post("/api/users/login", { email, password });
  return res.data;
};
export const axiosLogout = async () => {
  Axios.post("/api/users/logout");
};
export const readMessage = (topic, to) => {
  Axios.post("/api/messages/read", { topic, to });
};
export const addEventImage = async (image, label, imageSize, eventID) => {
  try {
    const data = new FormData();

    data.append("label", label);
    data.append("imageSize", imageSize);
    data.append("eventID", eventID);
    data.append("file", image);
    const response = await Axios.post("/api/eventImages/add", data);
    if (response.status === 201) {
      return true;
    }

    return false;
  } catch (err) {
    return false;
  }
};
export const addImage = async (image, label, imageSize, productID) => {
  try {
    const data = new FormData();

    data.append("label", label);
    data.append("imageSize", imageSize);
    data.append("productID", productID);
    data.append("file", image);
    const response = await Axios.post("/api/images/add", data);
    if (response.status === 201) {
      return true;
    }

    return false;
  } catch (err) {
    return false;
  }
};

export const sendMessage = (topic, to, type, message, time) => {
  Axios.post("/api/messages/send", { topic, to, type, message, time });
};

export const addToCart = (cartProduct, colour, size, quantity, session) => {
  Axios.post("/api/cart/add", {
    cartProduct,
    colour,
    size,
    quantity,
    session
  });
};

export const addProduct = async (productInfo, images, thumbImg) => {
  try {
    const res = await Axios.post("/api/products/create", {
      data: productInfo
    });
    const productID = +res.data.id;
    images.forEach(async (image, index) => {
      if (index === thumbImg) {
        image.size = "thumb";
      }

      const { imageFile, label, size } = image;
      const addImageRes = await addImage(imageFile, label, size, productID);
      if (!addImageRes)
        alert(
          `${JSON.stringify(
            imageFile
          )} failed to upload, go to edit product to try to add picture again`
        );
    });
    return productID;
  } catch (e) {
    return false;
  }
};

export const userGoing = async (eventID) => {
  const res = await Axios.post("/api/events/join", {
    eventID,
    status: "attending",
    reminder: true
  });
  return res.data;
};

export const addStock = async (id, quant) => {
  try {
    const response = await Axios.post("/api/stock/post", {
      quant,
      id
    });

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};

// export const createEvent = async (eventInfo) => {
//     try {
//         let createEvent = await Axios.post("/api/events/create", {
//             data: eventInfo,
//         });

//         window.location = "/dashboard";
//         return createEvent;
//     } catch (e) {
//         console.log(e);
//     }
// };

export const createEvent = async (eventInfo, images, thumbImg) => {
  try {
    const res = await Axios.post("/api/events/create", {
      data: eventInfo
    });
    const eventID = +res.data;
    images.forEach(async (image, index) => {
      if (index === thumbImg) {
        image.size = "thumb";
      }

      const { imageFile, label, size } = image;
      const addImageRes = await addEventImage(imageFile, label, size, eventID);
      if (!addImageRes)
        alert(
          `${JSON.stringify(
            imageFile
          )} failed to upload, go to edit event to try to add picture again`
        );
    });
    window.location = "/dashboard";
    return res;
  } catch (e) {
    return false;
  }
};

export const addToNewsletterList = async (email) => {
  try {
    const res = await Axios.post("/api/users/newsletter-signup", {
      email
    });
    return res.email;
  } catch (err) {
    return false;
  }
};
