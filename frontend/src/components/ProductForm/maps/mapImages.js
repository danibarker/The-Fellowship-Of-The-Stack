import React from "react";
import styled from "styled-components";
import { deleteImage } from "../../../axios/deletes";
import { LineCloseIcon } from "../../../images/icons";
import setImages from "../../../redux/actions/Images";
import theme from "../../Reusable/Colors";

const { UploadedImage, Radio } = require("../styledComponents");

// eslint-disable-next-line import/no-mutable-exports
export let thumbImg = 0;

export function mapImages(images, dispatch) {
  return images.map((image, index) => (
    <div>
      <UploadedImage key={image.id} alt="" src={image.image} />
      <DeleteImage
        onClick={() => {
          if (image.id) {
            deleteImage(image.id);
          }
          const newImages = images.filter((i, ind) => ind !== index);
          dispatch(setImages("productForm", newImages));
        }}
      >
        <LineCloseIcon stroke={theme.primary} />
      </DeleteImage>
      <Radio>
        <label htmlFor={`thumb${index}`}>
          <input
            type="radio"
            id={`thumb${index}`}
            name="chosenOne"
            onClick={() => {
              thumbImg = index;
            }}
          />
          Use as thumbnail image
        </label>
      </Radio>
    </div>
  ));
}

const DeleteImage = styled.div``;
