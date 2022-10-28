/* eslint-disable import/no-mutable-exports */
import React from "react";
import styled from "styled-components";
import { deleteImage } from "../../../axios/deletes";
import { LineCloseIcon } from "../../../images/icons";
import setImages from "../../../redux/actions/Images";
import theme from "../../Reusable/Colors";

const { UploadedImage, Radio } = require("../styledComponents");

export let thumbImg = 0;

export function MapImages(images, dispatch) {
  return images.map((image, index) => (
    <div>
      <UploadedImage key={index} alt="" src={image.image} />
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
