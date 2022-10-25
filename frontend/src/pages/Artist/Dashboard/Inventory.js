import React, { useState, useEffect } from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";
import axios from "axios";
// import Cookies from "universal-cookie";
import { getAllMyProducts } from "../../../axios/gets";
import Button from "../../../components/Reusable/Button";
import theme from "../../../components/Reusable/Colors";
import { AddIcon, EditIcon, DeleteIcon } from "../../../images/icons";
import DeleteProductModal from "../../../components/Dashboard/DeleteProductModal";

// const cookies = new Cookies();

const Inventory = () => {
  const [results, setResults] = useState([]);
  const [inventory, setInventory] = useState([]);
  // const [status, setStatus] = useState("");
  const [visible, setVisible] = useState(false);
  const [currentId, setCurrentId] = useState(null);

  useEffect(() => {
    const getProducts = async () => {
      try {
        const data = await getAllMyProducts();
        setResults(data);
      } catch (e) {
        // window.location = '/account'
      }
    };
    getProducts();
  }, []);

  useEffect(() => {
    const getStock = async () => {
      const data = await axios.get("api/stock/getAll");
      setInventory(data.data);
    };
    getStock();
  }, []);

  function groupStockObj(obj, id) {
    const result = [];
    obj.forEach((row) => {
      if (row.product_id === id) {
        result.push(row);
      }
    });
    return result;
  }

  function countInv(arr) {
    let invTotal = 0;
    const invItems = arr.length;
    arr.forEach((item) => {
      invTotal += item.quantity;
    });
    return `(${invTotal}) stock over ${invItems} variations.`;
  }

  const updateStatus = async (result, status) => {
    // eslint-disable-next-line no-param-reassign
    result.status = status;
    await axios.put(`api/products/edit/${result.id}`, {
      headers: {
        "Access-Control-Allow-Origin": "*"
      },
      data: result
    });
  };
  const showModal = (id) => {
    setVisible(!visible);
    setCurrentId(id);
  };
  return (
    <Container>
      <Link to="/dashboard/artist/products/create">
        <Button secondary style={{ float: "right" }}>
          Create a new product
          <AddIcon stroke={theme.primary} />
        </Button>
      </Link>
      <TableStyle>
        <thead>
          <tr>
            <th>PIC</th>
            <th>TITLE</th>
            <th>STATUS</th>
            <th>INVENTORY</th>
            <th>EDIT</th>
            <th>DELETE</th>
          </tr>
        </thead>
        <tbody>
          {results.length > 0 && inventory.length > 0 ? (
            results.map((result) => (
              <tr key={`inventory${result.title}`} style={{ padding: "10%" }}>
                <td
                  style={{
                    width: "100px",
                    height: "100px"
                  }}
                >
                  <img
                    alt={result.title}
                    src={
                      "https://versabucket.s3.us-east-2.amazonaws.com/images/" +
                      `${result.thumbnail}.jpeg`
                    }
                    style={{
                      width: "100%",
                      objectFit: "cover"
                    }}
                  />
                </td>
                <td>{result.title}</td>
                <td>
                  {result.status} <br />
                  <select
                    onChange={(e) => {
                      updateStatus(result, e.target.value);
                      // setStatus(newStatus);
                    }}
                  >
                    <option value={result.status}>Select Status</option>
                    <option label="Active">Active</option>
                    <option label="Backorder">Backorder</option>
                    <option label="Discontinue">Discontinue</option>
                  </select>
                </td>
                <td>{countInv(groupStockObj(inventory, result.id))}</td>
                <td>
                  <Link to={`/dashboard/artist/products/edit/${result.id}`}>
                    <EditIcon stroke={theme.primary} />
                  </Link>
                </td>
                <td>
                  <Button onClick={() => showModal(result.id)}>
                    <DeleteIcon stroke={theme.primary} />
                  </Button>
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td>Loading...</td>
            </tr>
          )}
        </tbody>
      </TableStyle>
      {visible ? (
        <DeleteProductModal
          value={visible}
          setter={setVisible}
          id={currentId}
          display="flex"
        />
      ) : (
        <DeleteProductModal
          value={visible}
          setter={setVisible}
          id={currentId}
          display="none"
        />
      )}
    </Container>
  );
};

export default Inventory;

const Container = styled.div`
  padding: 2em;
  min-height: 100vh;
  width: 100vw;
`;

export const TableStyle = styled.table`
  min-width: 655px;
  text-align: left;
  padding: 1%;
  margin-top: 10%;
  width: 100%;
  /* border: 1px solid black; */
  border-collapse: collapse;
  th {
    padding: 1%;
  }
  td {
    padding: 1%;
    border-collapse: collapse;
  }
`;
