import { getProductByID } from "../../axios/gets";

export const login = () => async (dispatch) => {
  dispatch({
    type: "LOGIN"
  });
};
export const logout = () => async (dispatch) => {
  dispatch({
    type: "LOGOUT"
  });
};
export const fetchProduct = (id) => async (dispatch) => {
  const data = getProductByID(id);

  dispatch({
    type: "FETCH_PRODUCT",
    payload: data
  });
};
export const setSelectedProduct = (id) => (dispatch) => {
  dispatch({
    type: "SELECT_PRODUCT",
    payload: id
  });
};

export const setPage = (page) => (dispatch) => {
  dispatch({
    type: "SET_PAGE",
    payload: page
  });
};
