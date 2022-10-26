import React from "react";
import axios from "axios";
import styled from "styled-components";
import Button from "../Reusable/Button";
import { Modal, ModalTitle } from "../Reusable/Modal";

const deleteItem = (id) => {
  const url = `/api/products/delete/${id}`;
  axios.delete(url, {
    headers: {
      "Access-Control-Allow-Origin": "*"
    }
  });
};

const DeleteProductModal = ({ display, value, setter, id }) => (
  <ModalCenter disp={display}>
    <Modal>
      <ModalTitle>Are you SURE you want to delete this product?</ModalTitle>
      <Button
        onClick={() => {
          if (value) {
            setter(false);
          } else {
            setter(true);
          }
        }}
      >
        Cancel
      </Button>
      <Button
        onClick={() => {
          if (value) {
            setter(false);
          } else {
            setter(true);
          }
          deleteItem(id);
          window.location.reload(false);
        }}
      >
        Accept
      </Button>
    </Modal>
  </ModalCenter>
);

const ModalCenter = styled.div`
  display: ${(props) => props.disp};
  top: 50%;
  position: fixed;
  width: "max-content";
`;

export default DeleteProductModal;
