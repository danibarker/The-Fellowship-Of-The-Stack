import React from "react";
import crop from "../../imageUtils";
import setImages from "../../redux/actions/Images";

const ImageInput = (dispatch, images, form) => (
  <input
    style={{ width: "115px" }}
    onChange={(e) => {
      if (e.target.files.length > 0) {
        const image = URL.createObjectURL(e.target.files[0]);

        crop(image, 1).then((img) => {
          // add that image to the images to be sent to AWS
          dispatch(
            setImages(form, [
              ...images,
              {
                image,
                label: "test",
                imageFile: img,
                size: "full"
              }
            ])
          );
        });
      }
    }}
    type="file"
    accept="image/jpeg"
  />
);

export default ImageInput;
