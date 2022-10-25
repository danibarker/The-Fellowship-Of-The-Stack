import React from "react";
import { LineCloseIcon } from "../../../images/icons";
import { ColorOption, ColorPreview, RemoveIcon } from "../styledComponents";
import deleteItem from "../functions/deleteItem";
import { setFormInputs } from "../../../redux/actions/Forms";

function mapColors(colours, dispatch) {
  return colours.map((color, index) => (
    <ColorOption>
      <ColorPreview color={color.value} />
      {color.label}
      <RemoveIcon
        onClick={() => {
          deleteItem(index, colours, setFormInputs, dispatch, "colours");
        }}
      >
        <LineCloseIcon stroke="black" />
      </RemoveIcon>
    </ColorOption>
  ));
}

export default mapColors;
