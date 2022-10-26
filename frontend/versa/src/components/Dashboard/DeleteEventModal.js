import React from "react";
import styled from "styled-components";
import Button from "../Reusable/Button";
import { Modal, ModalTitle } from "../Reusable/Modal";

import { deleteArtistEvent } from "../../axios/deletes";

const DeleteEventModal = ({ display, value, setter, id }) => (
  <ModalCenter disp={display}>
    <Modal>
      <ModalTitle>Are you SURE you want to delete this Event?</ModalTitle>
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
          deleteArtistEvent(id);
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

export default DeleteEventModal;
