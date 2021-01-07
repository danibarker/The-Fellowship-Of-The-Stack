import React from "react";
import styled from "styled-components";
import { WishListIcon, Star, Circle } from "../../images/icons";

const ProductSummaryContainer = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    padding: 20px;
`;
const NameAddWishContainer = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    padding: 0px;
`;
const ProductName = styled.div`
    font-size: 30px;
    margin: 0 20px;
`;
const PriceReviewContainer = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;

    &:span {
        margin: 0 20px;
    }
`;
const PriceSoldContainer = styled.div`
    display: flex;
    margin: 0 20px;
`;
const Price = styled.div`
    margin: 0 20px;
`;
const ProductSold = styled.div`
    margin: 0 20px;
`;
const ReviewContainer = styled.div`
    display: flex;
`;
const NumReviews = styled.div`
    margin: 0 20px;
`;
const VariationsContainer = styled.div`
    display: flex;
`;
const VariationsOptions = styled.div`
    margin: 0 20px;
`;
const SizeContainer = styled.div`
    display: flex;
`;
const Dimensions = styled.div`
    display: flex;
`;
const ShortDescriptionContainer = styled.div`
    margin: 0 20px;
`;
const ShortDescription = styled.p`
    margin: 0 20px;
`;
const ButtonContainer = styled.div`
    display: flex;
`;
const Buy = styled.button`
    margin: 0 20px;
`;
const AddToCart = styled.button`
    margin: 0 20px;
`;

const ProductSummary = ({
    title,
    price,
    description,
    image,
    num_sales,
    num_stars,
    num_reviews,
    variations,
    artist,
    size,
    materials,
}) => {
    return (
        <ProductSummaryContainer>
            <NameAddWishContainer>
                <ProductName>{title}</ProductName>
                <WishListIcon />
            </NameAddWishContainer>
            <PriceReviewContainer>
                <PriceSoldContainer>
                    <Price>${price}</Price>
                    <ProductSold>{num_sales} sold</ProductSold>
                </PriceSoldContainer>
                <span>|</span>
                <ReviewContainer>
                    <Star />
                    <Star />
                    <Star />
                    <Star />
                    <NumReviews>{num_reviews} reviews</NumReviews>
                </ReviewContainer>
            </PriceReviewContainer>
            <VariationsContainer>
                <h5>Variations </h5>
                <VariationsOptions>
                    <Circle />
                    <Circle />
                    <Circle />
                    <Circle />
                </VariationsOptions>
            </VariationsContainer>
            <SizeContainer>
                <h5>Size</h5>
                <Dimensions>
                    {size}
                    <p>12</p>
                    <p>x</p>
                    <p>12</p>
                    <p>x</p>
                    <p>12</p>
                </Dimensions>
            </SizeContainer>
            <ShortDescriptionContainer>
                <ShortDescription>{description}</ShortDescription>
            </ShortDescriptionContainer>
            <ButtonContainer>
                <Buy>Buy</Buy>
                <AddToCart>Add To Cart</AddToCart>
            </ButtonContainer>
        </ProductSummaryContainer>
    );
};

export default ProductSummary;

//map: stars, variations and dimensions