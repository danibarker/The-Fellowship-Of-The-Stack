import Axios from "axios";

export const axiosLogin = async (email, password) => {
    let res = await Axios.post("/api/users/login", { email, password });
    return res.data;
};
export const addProduct = async (productInfo, images, thumbImg) => {
    let res = await Axios.post("/api/products/create", {
        data: productInfo,
    });
    let productID = +res.data.id;

    images.forEach(async (image, index) => {
        if (index === thumbImg) {
            image.size = "thumb";
        }

        let { imageFile, label, size } = image;
        let res = await addImage(imageFile, label, size, productID);
        if (!res)
            alert(
                JSON.stringify(imageFile) +
                    " failed to upload, go to edit product to try to add picture again"
            );
    });
    return productID;
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
        console.error(err);
        return false;
    }
};

export const userGoing = async (eventID) => {
    let res = await Axios.post(`api/events/join/${eventID}`, {
        status: "attending",
        reminder: true,
    });
    return res.data;
};

export const addStock = async (id, quant) => {
    try {
        const response = await Axios.post("/api/stock/post", {
            quant,
            id,
        });

        if (response.status === 201) {
            return true;
        }
    } catch (err) {
        console.log(err);
        return false;
    }
};
/**
 * {
 *   Response: {
 *     bucket: "myBucket",
 *     key: "image/test-image.jpg",
 *     location: "https://myBucket.s3.amazonaws.com/media/test-file.jpg"
 *   }
 * }
 */

// var s3 = new AWS.S3({
//     aws_access_key_id: accessKeyId,
//     aws_secret_access_key: secretKey,
// });

// // configuring parameters
// var params = {
//     Bucket: BUCKET_NAME,
//     Body: image,
//     Key: "images/" + filename,
// };

// s3.upload(params, async function (err, data) {
//     //handle error
//     if (err) {
//         console.log("Error", err);
//         return false;
//     }

//     //success
//     if (data) {
//         console.log("Uploaded in:", data.Location);
//         let response = await Axios.post("/api/images/add", {
//             filename: filename,
//             label: label,
//             image_size: imageSize,
//             productID: productID,
//         });
//         if (response.status(201)) {
//             return true;
//         }
//         return false;
//     }
// });

// var params = {
//     Key: "folder/1610482949524_sample.txt",
//     Bucket: BUCKET_NAME,
// };
// s3.getObject(params, function (err, data) {
//     if (err) {
//         throw err;
//     }
//     fs.writeFileSync("./sample1.txt", data.Body);
//     console.log("file downloaded successfully");
// });
