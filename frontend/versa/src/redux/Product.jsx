import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProduct } from "./actions";

const Product = () => {
  const dispatch = useDispatch();
  const product = useSelector((state) => state.productData);

  useEffect(() => {
    dispatch(fetchProduct());
  }, [dispatch]);
  return (
    <div>
      {product.map((el) => (
        <h5>{el.title}</h5>
      ))}
    </div>
  );
};

export default Product;
