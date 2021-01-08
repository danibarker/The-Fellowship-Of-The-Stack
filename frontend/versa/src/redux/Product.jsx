import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProduct } from "./actions";

const Product = () => {
    const dispatch = useDispatch();
    const product = useSelector((state) => state);

    useEffect(() => {
        dispatch(fetchProduct());
    }, []);
    return (
        <div>
            {product.map((el) => {
                return <h5>{el.title}</h5>;
            })}
        </div>
    );
};

export default Product;