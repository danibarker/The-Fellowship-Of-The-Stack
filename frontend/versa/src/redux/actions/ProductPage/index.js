export const setChoices = (choiceKey, choiceValue) => async (dispatch) => {
  dispatch({
    type: "PRODUCT_SET_CHOICES",
    payload: { choiceKey, choiceValue }
  });
};
export const clearChoices = () => async (dispatch) => {
  dispatch({
    type: "PRODUCT_CLEAR_CHOICES"
  });
};
