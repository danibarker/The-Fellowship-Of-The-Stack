import React from "react";
import styled from "styled-components";
import ArtistDetails from "../../components/Product/ArtistDetails";
import CustomerReviews from "../../components/Product/CustomerReviewsSection";
import ProductPageImage from "../../components/Product/ProductPageImage";

import ProductData from "../../components/Product/ProductData";

const ProductItem = () => {
    return (
        <ProductItemContainer>
            <ProductPageImage />
            <ProductData />
            <ArtistDetails />
            <CustomerReviews />
        </ProductItemContainer>
    );
};

export default ProductItem;

const ProductItemContainer = styled.div``;
