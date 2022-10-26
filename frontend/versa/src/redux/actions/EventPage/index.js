export const setChoices = (choiceKey, choiceValue) => async (dispatch) => {
  dispatch({
    type: "EVENT_SET_CHOICES",
    payload: { choiceKey, choiceValue }
  });
};
export const clearChoices = () => async (dispatch) => {
  dispatch({
    type: "EVENT_CLEAR_CHOICES"
  });
};
