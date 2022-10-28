function deleteItem(index, arr, set, dispatch, type) {
  const newArray = [...arr];
  newArray.splice(index, 1);
  dispatch(set("product", type, newArray));
}

export default deleteItem;
