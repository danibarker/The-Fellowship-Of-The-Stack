import { getImagesByPID, getProductByID } from "../../../axios/gets";
import { clearFormInputs, setFormInputs } from "../../../redux/actions/Forms";
import setImages from "../../../redux/actions/Images";

function loadPage(id, dispatch, type) {
  const getProductData = async () => {
    const data = await getProductByID(id);
    const pictures = await getImagesByPID(id);
    dispatch(setFormInputs("product", "title", data.title));
    dispatch(setFormInputs("product", "price", data.price));
    dispatch(setFormInputs("product", "desc", data.description));
    dispatch(setFormInputs("product", "materials", data.materials));
    dispatch(setFormInputs("product", "colours", data.colours));
    dispatch(setFormInputs("product", "sizes", data.sizes));
    dispatch(
      setImages(
        "productForm",
        pictures.map((picture) => ({
          image: `https://versabucket.s3.us-east-2.amazonaws.com/images/${picture.filename}.jpeg`,
          label: picture.label,
          imageFile: "update",
          size: "full",
          filename: picture.filename,
          id: picture.id
        }))
      )
    );
  };
  if (type === "Edit") {
    getProductData();
  } else {
    dispatch(clearFormInputs("product"));
    dispatch(setImages("productForm", []));
  }
}

export default loadPage;
