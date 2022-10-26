import React, { useState } from "react";
import styled from "styled-components";
import PageContainer from "../../../components/Redesign/Reusable/PageContainer";
import Header from "../../../components/Redesign/Reusable/Header";
import SalesByProduct from "./SalesByProduct";
import TotalOrders from "./TotalOrders";
import TotalSales from "./TotalSales";
import AvgOrderValue from "./AvgOrderValue";

import Button from "../../../components/Redesign/Reusable/Button";

const Analytics = () => {
  const [nav, setNav] = useState("TS");
  return (
    <PageContainer>
      <Header title="Analytics" />
      <Nav>
        <Button
          onClick={() => {
            setNav("TS");
          }}
          primarySmall
        >
          Total Sales
        </Button>
        <Button
          onClick={() => {
            setNav("TO");
          }}
          secondarySmall
        >
          Total Orders
        </Button>
        <Button
          onClick={() => {
            setNav("SBP");
          }}
          secondarySmall
        >
          Sales By Product
        </Button>
        <Button
          onClick={() => {
            setNav("OA");
          }}
          secondarySmall
        >
          Order Average
        </Button>
      </Nav>
      {nav === "TS" && <TotalSales />}
      {nav === "TO" && <TotalOrders />}
      {nav === "SBP" && <SalesByProduct />}
      {nav === "OA" && <AvgOrderValue />}
    </PageContainer>
  );
};

export default Analytics;

const Nav = styled.div`
  place-self: flex-start;
  display: flex;
  width: 1066px;
  justify-content: space-between;
`;
