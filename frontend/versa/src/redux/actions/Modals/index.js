const setVisible = (modalPage, modalName, visible) => async (dispatch) => {
  dispatch({
    type: "SET_MODAL_VISIBLE",
    payload: { modalPage, modalName, visible }
  });
};

export default setVisible;
