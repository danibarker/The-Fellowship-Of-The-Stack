import React, { useState, useEffect } from "react";
import { getAssignedPickups } from "../../../axios/gets";
import Loading from "../../../components/Redesign/Reusable/Loading";
import AssignedPickupsTable from "../../../components/Dashboard/Driver/AssignedPickupsTable";
import PageContainer from "../../../components/Redesign/Reusable/PageContainer";
import Header from "../../../components/Redesign/Reusable/Header";

const AssignedPickups = () => {
  const [orderData, setOrderData] = useState();

  useEffect(() => {
    const fetchData = async () => {
      const data = await getAssignedPickups();
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
        title="Pick Ups"
        sub={
          "These are your orders you need to pick up to finish your deliveries for the day." +
          " They are grouped by artist address so that you can pick items up in batches."
        }
        link="/dashboard/driver/"
        linkText="Dashboard"
      />
      {!orderData ? (
        <Loading />
      ) : (
        <AssignedPickupsTable orderData={orderData} />
      )}
    </PageContainer>
  );
};

export default AssignedPickups;
