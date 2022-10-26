import React from "react";
import Button from "../Reusable/Button";

import { ColorInput, Input } from "../Reusable/Input";
import { Modal, ModalTitle } from "../Reusable/Modal";
import setVisible from "../../redux/actions/Modals";

const ColourModal = ({ modalToggle, dispatch, setColorLabelAndValue }) =>
  modalToggle.colours && (
    <Modal width="fit-content">
      <ModalTitle>Add A Color Option</ModalTitle>
      <label htmlFor="colorToAdd">
        Click To Choose Color
        <ColorInput id="colorToAdd" />
      </label>
      <label>
        Color Name
        <Input label="Color Name" id="colorLabelToAdd" />
      </label>
      <Button
        onClick={() => {
          dispatch(setVisible("productForm", "colours", false));
        }}
      >
        Cancel
      </Button>
      <Button
        primary
        onClick={() => {
          setColorLabelAndValue();
          dispatch(setVisible("productForm", "colours", false));
        }}
      >
        Add Option
      </Button>
    </Modal>
  );

export default ColourModal;
