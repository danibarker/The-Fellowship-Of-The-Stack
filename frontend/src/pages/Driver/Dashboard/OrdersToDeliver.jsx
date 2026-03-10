import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { getOrdersForDriver } from "../../../axios/gets";
import Loading from "../../../components/Redesign/Reusable/Loading";
import OrdersToDeliverTable from "../../../components/Dashboard/Driver/OrdersToDeliverTable";
import Header from "../../../components/Redesign/Reusable/Header";
import PageContainer from "../../../components/Redesign/Reusable/PageContainer";

const OrdersToDeliver = () => {
  const [orderData, setOrderData] = useState();
  const params = useParams();
  const currentUser = params.id;

  useEffect(() => {
    const fetchData = async () => {
      const data = await getOrdersForDriver();

      setOrderData(data);
    };
    window.scrollTo({
      top: 0,
      left: 0
    });
    fetchData();
  }, []);

  return (
    <PageContainer>
      <Header
        title="Orders to Deliver"
        sub={
          "Add orders to your delivery list and view the items" +
          "you need to pick up for that order."
        }
        link="/dashboard/driver"
        linkText="Dashboard"
      />
      {!orderData ? (
        <Loading />
      ) : (
        <OrdersToDeliverTable orderData={orderData} user={currentUser} />
      )}
    </PageContainer>
  );
};

export default OrdersToDeliver;
