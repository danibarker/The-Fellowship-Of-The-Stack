const setRedirect = (redirectPage, redirectValue) => async (dispatch) => {
  dispatch({
    type: "SET_REDIRECT",
    payload: { redirectPage, redirectValue }
  });
};

export default setRedirect;
