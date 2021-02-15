import React, { useState, useEffect } from "react";
import styled from "styled-components";
import { useHistory } from "react-router-dom";
import theme from "../../Reusable/Colors";
import Loading from "../../Reusable/Loading";
import DropDown from "./DropDown";

const OrdersTable = ({ user, orderData }) => {
    const [data, setData] = useState(orderData);
    const [sortType, setSortType] = useState();
    const [query, setQuery] = useState();

    const sortOptions = [
        {
            value: "orderdate",
            label: "Order Date",
        },
        {
            value: "id",
            label: "Order ID",
        },
    ];

    useEffect(() => {
        const sortArray = (type) => {
            const types = {
                orderdate: (a, b) => {
                    if (a.orderDate < b.orderDate) {
                        return -1;
                    }
                },
                id: (a, b) => {
                    return a.id - b.id;
                },
            };
            const sortProperty = types[type];
            const sorted = [...orderData].sort(sortProperty);
            console.log(sorted);
            setData(sorted);
        };

        sortArray(sortType);
    }, [sortType]);

    let headers = [
        "Order ID",
        "Buyer Name",
        "Buyer Address",
        "Date",
        "Status",
        "Date Received by Buyer",
    ];

    const history = useHistory();

    const handleChange = (e) => {
        e.preventDefault();
        setQuery(e.target.value);
    };

    const filterData = (data, query) => {
        if (!query) {
            return data;
        }

        return data.filter((order) => {
            let dataValue = Object.values(order).toString().toLowerCase();
            return dataValue.includes(query.toLowerCase());
        });
    };

    const filteredData = filterData(data, query);

    return (
        <TableContainer>
            {!orderData ? (
                <Loading />
            ) : (
                <>
                    <Sort>
                        <h2>Sort by: </h2>
                        <SortChoice
                            name="sort"
                            id="sort"
                            value={sortType}
                            onChange={(e) => setSortType(e.target.value)}>
                            {sortOptions.map((option) => (
                                <>
                                    <option value={option.value}>
                                        {option.label}
                                    </option>
                                </>
                            ))}
                        </SortChoice>
                        <h2>Filter: </h2>
                        <input
                            type="text"
                            placeholder="Search..."
                            onChange={handleChange}
                            value={query || ""}></input>
                    </Sort>
                    <Table>
                        <thead>
                            <Headers>
                                {headers.map((header, index) => (
                                    <th key={`header${index}`}>
                                        <h2>{header}</h2>
                                    </th>
                                ))}
                            </Headers>
                        </thead>
                        {filteredData &&
                            filteredData.map((order, index) => (
                                <BodyRows key={order.name + index}>
                                    <td
                                        onClick={() =>
                                            history.push(
                                                `/dashboard/recent-orders/${order.id}`
                                            )
                                        }
                                        data-title="Order ID">
                                        <p>{order.id}</p>
                                    </td>
                                    <td
                                        onClick={() =>
                                            history.push(
                                                `/dashboard/recent-orders/${order.id}`
                                            )
                                        }
                                        data-title="Buyer Name">
                                        <p>{order.name}</p>
                                    </td>
                                    <td
                                        onClick={() =>
                                            history.push(
                                                `/dashboard/recent-orders/${order.id}`
                                            )
                                        }
                                        data-title="Buyer Address">
                                        <p>{order.shipping_address}</p>
                                    </td>
                                    <td
                                        onClick={() =>
                                            history.push(
                                                `/dashboard/recent-orders/${order.id}`
                                            )
                                        }
                                        data-title="Date">
                                        <p>
                                            {order.orderDate === null
                                                ? "Error Loading Order Date"
                                                : order.orderDate}
                                        </p>
                                    </td>
                                    <td data-title="Status">
                                        <DropDown order={order} />
                                    </td>
                                    <td
                                        onClick={() =>
                                            history.push(
                                                `/dashboard/recent-orders/${order.id}`
                                            )
                                        }
                                        data-title="Date Received by Buyer">
                                        <p>
                                            {order.orderShipDate === null
                                                ? "Not Received Yet"
                                                : order.orderShipDate}
                                        </p>
                                    </td>
                                </BodyRows>
                            ))}
                    </Table>
                </>
            )}
        </TableContainer>
    );
};

export default OrdersTable;

const TableContainer = styled.div`
    justify-self: center;
`;

const Sort = styled.div`
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 1em;
    h2 {
        margin: 0 16px 0 0;
        font-size: 1em;
        font-weight: 700;
        text-transform: uppercase;
        color: ${theme.primary};
    }
    input {
        padding: 8px;
        outline: none;
        min-width: 150px;
        border: ${(props) =>
            props.border === true
                ? `2px solid ${theme.primaryHover}`
                : `2px solid ${theme.primary}`};
        :active,
        :hover,
        :focus {
            border: ${(props) =>
                props.border === true
                    ? `2px solid #77dd77`
                    : `2px solid ${theme.primaryHover}`};
        }
    }
    @media screen and (max-width: 600px) {
        flex-direction: column;
        align-items: flex-start;
        h2 {
            margin-bottom: 16px;
        }
        select {
            margin-bottom: 16px;
        }
        input {
            margin-bottom: 16px;
        }
    }
`;

const Table = styled.table`
    position: relative;
    border-collapse: collapse;
    margin: 0 1em 2em 1em;
    font-size: 0.9em;
    box-shadow: 3px 3px 10px rgba(27, 49, 66, 0.13);
    border-radius: 15px 15px 0px 0px;
    thead th {
        position: sticky;
        top: 0;
    }
    th,
    td {
        padding: 12px 15px;
    }
`;
const Headers = styled.tr`
    background-color: ${theme.primary};

    h2 {
        color: ${theme.secondary};
        text-align: left;
        margin-bottom: 0;
        text-transform: uppercase;
        font-size: 0.8em;
        /* letter-spacing: 0.03em; */
    }
`;
const BodyRows = styled.tr`
    border-bottom: thin solid #dddddd;
    cursor: pointer;
    p {
        color: ${theme.tertiary};
        margin-bottom: 0;
    }
    :hover {
        background-color: ${theme.primary + "40"};
    }
    :nth-of-type(even) {
        background-color: #eff3fe60;
        :hover {
            background-color: ${theme.primary + "40"};
        }
    }

    :last-of-type {
        border-bottom: 2px solid ${theme.primary};
    }
`;

const SortChoice = styled.select`
    padding: 8px;
    outline: none;
    min-width: 150px;
    cursor: pointer;
    margin-right: 32px;
    border: ${(props) =>
        props.border === true
            ? `2px solid ${theme.primaryHover}`
            : `2px solid ${theme.primary}`};
    :active,
    :hover,
    :focus {
        border: ${(props) =>
            props.border === true
                ? `2px solid ${theme.primaryHover}`
                : `2px solid ${theme.primaryHover}`};
    }
`;
