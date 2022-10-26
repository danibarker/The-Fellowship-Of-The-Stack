import Axios from "axios";
import { addEventImage, addImage } from "../posts";

export const updateProductImage = async (
  label,
  imageSize,
  productID,
  filename
) => {
  try {
    const response = await Axios.put("/api/images/update", {
      imageSize,
      productID,
      label,
      filename
    });
    if (response.status === 201) {
      return true;
    }

    return false;
  } catch (err) {
    return false;
  }
};
export const updateEventImage = async (label, imageSize, eventID, filename) => {
  try {
    const response = await Axios.put("/api/eventImages/update", {
      imageSize,
      eventID,
      label,
      filename
    });
    if (response.status === 201) {
      return true;
    }

    return false;
  } catch (err) {
    return false;
  }
};

export const editProduct = async (productInfo, images, id, thumbImg) => {
  await Axios.put(`/api/products/edit/${id}`, {
    data: productInfo
  });
  const productID = +id;
  images.forEach(async (image, index) => {
    if (index === thumbImg) {
      // eslint-disable-next-line no-param-reassign
      image.size = "thumb";
    }

    if (image.imageFile === "update") {
      const { label, size, filename } = image;
      const res = await updateProductImage(label, size, id, filename);
      if (!res) {
        // eslint-disable-next-line no-alert
        alert("failed to update thumbnail choice");
      }
    } else if (image.imageFile === "delete") {
      // const { filename } = image;
      // let res = await deleteImage(filename)
      // if (!res) {
      //    alert(`Failed to delete image ${index}`)
      // }
    } else {
      const { imageFile, label, size } = image;
      const res = await addImage(imageFile, label, size, productID);
      if (!res)
        // eslint-disable-next-line no-alert
        alert(
          `${JSON.stringify(
            imageFile
          )} failed to upload, go to edit product to try to add picture again`
        );
    }
  });
  return productID;
};

// created a put request for editStock part of product form and passed stock prop from productForm to submitData to sendProductData to here
export const editStock = async (id, quant) => {
  try {
    const response = await Axios.put("/api/stock/update", {
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

// update order status when artist changes its status within dashboard order page

export const updateOrderStatus = async (orderStatus, id) => {
  try {
    const response = await Axios.put(`/api/orders/edit/${id}`, {
      orderStatus
    });

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};

export const addToDeliveries = async (id) => {
  try {
    const response = await Axios.put(`/api/dashboard/ready-to-deliver${id}`, {
      orderStatus: "Driver Assigned"
    });

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};

export const updateOrderShipDate = async (orderStatus, shipDate, id) => {
  try {
    const response = await Axios.put(`/api/orders/edit/${id}`, {
      orderStatus,
      shipDate
    });

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};

export const driverUpdateStatus = async (orderStatus, orderid) => {
  try {
    await Axios.put(`/api/dashboard/driver/deliveries/update/${orderid}`, {
      status: orderStatus
    });
    return true;
  } catch (err) {
    return false;
  }
};

// update event status

export const updateEventStatus = async (status, id) => {
  try {
    const response = await Axios.put(`/api/events/edit/${id}`, {
      data: { status }
    });

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};

export const editEvent = async (event, images, id, thumbImg) => {
  try {
    await Axios.put(`/api/events/edit/${event.id}`, {
      data: event
    });
    const eventID = +event.id;
    images.forEach(async (image, index) => {
      if (index === thumbImg) {
        // eslint-disable-next-line no-param-reassign
        image.size = "thumb";
      }

      if (image.imageFile === "update") {
        const { label, size, filename } = image;
        const res = await updateEventImage(label, size, id, filename);
        if (!res) {
          // eslint-disable-next-line no-alert
          alert("failed to update thumbnail choice");
        }
      } else {
        const { imageFile, label, size } = image;
        const res = await addEventImage(imageFile, label, size, eventID);
        if (!res)
          // eslint-disable-next-line no-alert
          alert(
            `${JSON.stringify(
              imageFile
            )} failed to upload, go to edit event to try to add picture again`
          );
      }
    });
    return eventID;
    // if (response.status === 201) {
    //     return true;
    // }
  } catch (err) {
    return false;
  }
};

export const modifyCart = async (
  cartProduct,
  colour,
  size,
  quantity,
  session
) => {
  const modCartResponse = await Axios.put("/api/cart/edit", {
    cartProduct,
    colour,
    size,
    quantity,
    session
  });
  return modCartResponse.data;
};

export const addDriverID = (orderid) => {
  try {
    const response = Axios.put(
      `/api/dashboard/driver/order-to-fulfill/add/${orderid}`
    );
    return response.status;
  } catch (err) {
    return false;
  }
};
export const removeDriverID = (orderid) => {
  try {
    const response = Axios.put(
      `/api/dashboard/driver/order-to-fulfill/remove/${orderid}`
    );
    return response.status;
  } catch (err) {
    return false;
  }
};

export const setProductAsPicked = async (status, singleId) => {
  try {
    const response = await Axios.put(
      "/api/dashboard/driver/assigned-pickups/",
      {
        driverStatus: status,
        singleID: singleId
      }
    );

    if (response.status === 201) {
      return true;
    }
    return false;
  } catch (err) {
    return false;
  }
};
