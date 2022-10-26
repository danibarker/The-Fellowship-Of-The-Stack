const setImages = (page, images) => async (dispatch) => {
  dispatch({
    type: "SET_IMAGES",
    payload: { page, images }
  });
};

export default setImages;
