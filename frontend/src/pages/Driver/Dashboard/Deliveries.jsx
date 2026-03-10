import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { getReadyDeliveries } from "../../../axios/gets";
import Loading from "../../../components/Redesign/Reusable/Loading";
import ReadyDeliveriesTable from "../../../components/Dashboard/Driver/ReadyDeliveriesTable";
import PageContainer from "../../../components/Redesign/Reusable/PageContainer";
import Header from "../../../components/Redesign/Reusable/Header";

const Deliveries = () => {
  const [orderData, setOrderData] = useState();
  const params = useParams();
  const currentUser = params.id;

  useEffect(() => {
    const fetchData = async () => {
      const data = await getReadyDeliveries();

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
        title="Ready to Deliver"
        sub="These are orders that you have completed pickups for and are ready to deliver. "
        link="/dashboard/driver"
        linkText="Dashboard"
      />
      {!orderData ? (
        <Loading />
      ) : (
        <ReadyDeliveriesTable orderData={orderData} user={currentUser} />
      )}
    </PageContainer>
  );
};

export default Deliveries;
