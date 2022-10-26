export const setFormInputs = (form, key, value) => async (dispatch) => {
  dispatch({
    type: "FORM_SET_INPUTS",
    payload: { form, key, value }
  });
};

export const clearFormInputs = (form) => async (dispatch) => {
  dispatch({
    type: "FORM_CLEAR_INPUTS",
    payload: form
  });
};
