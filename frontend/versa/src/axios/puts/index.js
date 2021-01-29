import Axios from 'axios'
import { addImage } from '../posts';
export const editProduct = async (productInfo, images, id, thumbImg) => {
    await Axios.put("/products/edit/" + id, {
        data: productInfo,
    });
    let productID = +id;
    images.forEach(async (image, index) => {

        if (index === thumbImg) {
            image.size = "thumb";
        }
    

    
        if (image.imageFile === 'update') {
            let { label, size, filename } = image;
            let res = await updateImage(label, size, id, filename);
            if (!res) {
                alert('failed to update thumbnail choice')
            }
        } else if (image.imageFile === 'delete') {
            let { filename } = image;
            //let res = await deleteImage(filename)
            //if (!res) {
            //    alert(`Failed to delete image ${index}`)
            //}
        } else {
            let { imageFile, label, size } = image;
            let res = await addImage(imageFile, label, size, productID);
            if (!res)
                alert(
                    JSON.stringify(imageFile) +
                    " failed to upload, go to edit product to try to add picture again"
                );
        }
    
    });
    return productID;
}
export const updateImage = async (label, imageSize, productID, filename) => {
    try {
        
            const response = await Axios.put("/images/update", {
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
        console.error(err);
        return false;
    }
};