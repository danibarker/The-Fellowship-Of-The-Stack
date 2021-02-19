import React from "react";
import styled from "styled-components";

const AssignedDeliveryCard = ({ order }) => {
    const {
        name,
        title,
        color,
        quantity,
        size,
        shipping_address,
        driver_status,
    } = order;

    console.log("c", order);
    return (
        <Card>
            <Quantity>
                <p>{quantity}</p>
            </Quantity>
            <ItemDetails>
                <h3>{name}</h3>
                <Variation>
                    <h4>Delivery address:</h4>

                    <p>{shipping_address}</p>
                </Variation>

                <Variation>
                    <h4>Product:</h4>

                    <p>{title}</p>
                </Variation>
                <Variation>
                    <h4>Colour:</h4>

                    <p>{color}</p>
                </Variation>
                <Variation>
                    <h4>Size:</h4>

                    <p>{size}</p>
                </Variation>
                <Variation>
                    <h4>Status:</h4>

                    <p>{driver_status === null ? "Not set" : driver_status}</p>
                </Variation>
            </ItemDetails>
        </Card>
    );
};

export default AssignedDeliveryCard;

const Card = styled.article`
    border-radius: 15px;
    padding: 1em;
    height: fit-content;
    display: flex;
    flex-direction: row;
    align-items: center;
    background: #fff;
    box-shadow: 3px 3px 10px rgba(27, 49, 66, 0.13);
    border-radius: 15px;
    :hover {
        box-shadow: 7px 7px 30px rgba(27, 49, 66, 0.13);
    }

    transition: 0.3s;
`;

const ItemDetails = styled.div`
    h3 {
        font-weight: 700;
        margin-bottom: 0.8em;
    }
`;

const Quantity = styled.div`
    padding: 1em;
    p {
        font-size: 60px;
    }
`;

const Variation = styled.div`
    display: flex;
    flex-direction: row;
    align-items: center;
    :first-of-type {
        margin-bottom: 0.3em;
    }

    h4 {
        margin-right: 8px;
        font-weight: 700;
    }
    p {
        margin: 0;
        line-height: 0;
    }
`;
