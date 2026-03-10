import React, { useState, useEffect } from "react";

import { getAttendingEvents } from "../../../axios/gets";
import Loading from "../../../components/Reusable/Loading";
import PageContainer from "../../../components/Redesign/Reusable/PageContainer";
import Header from "../../../components/Redesign/Reusable/Header";
import UserEventsTable from "../../../components/Dashboard/AnalyticsTables/UserEventsTable";

const EventsAttending = () => {
  const [eventsData, setEventsData] = useState([]);

  useEffect(() => {
    const getEvents = async () => {
      try {
        const data = await getAttendingEvents();
        return setEventsData(data);
      } catch (e) {
        return e;
      }
    };
    getEvents();
  }, []);

  return (
    <PageContainer>
      <Header title="Upcoming Events" />

      {!eventsData ? <Loading /> : <UserEventsTable eventsData={eventsData} />}
    </PageContainer>
  );
};

export default EventsAttending;
