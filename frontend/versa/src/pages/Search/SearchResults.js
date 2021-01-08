import React, { useState, useEffect } from "react";
import Categories from "../../components/Search/Categories";
import Sort from "../../components/Search/Sort";
import Filters from "../../components/Search/Filters";
import ProductCard from "../../components/Search/ProductCard.js";
import axios from "axios";
import styled from "styled-components";
import { Magnifying } from "../../images/icons";


const SearchResults = () => {
    
    const [products, setProducts] = useState([]);

    useEffect(() => {
        const getProducts = async () => {
            let res = await axios.get("http://localhost:5000/allProducts");
            setProducts(res.data);
        };
        getProducts();
    }, []);

    return (
        <SearchPage>
            <SearchBarDiv>
                <MagnifyIcon>
                    <Magnifying />
                </MagnifyIcon>
                <SearchBar placeholder="Search" type="text" />
            </SearchBarDiv>
            <div>
                <SearchCriteria>
                    <Categories />
                    <Sort />
                    <Filters />
                </SearchCriteria>
            </div>
            <Products>
                {products.map((product) => (
                    <ProductCard
                        onClick={() => {
                            console.log('clicked')
                            
                        }}
                        product={product}
                    />
                ))}
            </Products>
        </SearchPage>
    );
};
const MagnifyIcon = styled.div`
    position: absolute;
    margin-top: 20px;
    right: 30px;
`;
const SearchBarDiv = styled.div``;
const SearchBar = styled.input`
    padding: 5px;
    font-size: 26px;
    width: 100%;
    height: 50px;
    margin: 10px 0;
`;

const SearchCriteria = styled.div`
    display: flex;
    justify-content: space-between;
    margin: 10px 0;
`;

const SearchPage = styled.div`
    padding: 6%;
`;

const Products = styled.div`
    margin-top: 20px;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: 0 6%;
`;
export default SearchResults;