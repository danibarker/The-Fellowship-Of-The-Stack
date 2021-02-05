import React, { useState, useEffect } from "react";
import styled from "styled-components";
import Button from "../Reusable/Button";
import { Link, useParams } from "react-router-dom";
import { getEventByID } from "../../axios/gets";
import theme from "../Reusable/Colors";
import { LeftIcon, Going, NotGoing } from "../../images/icons";

const EventPage = () => {
    const [going, setGoing] = useState(false);
    let params = useParams();
    const currentEvent = params.id;
    const [eventData, setEventData] = useState([]);
    const [dateTime, setDateTime] = useState();

    useEffect(() => {
        const fetchEvent = async () => {
            const data = await getEventByID(currentEvent);
            setEventData(data);
            console.log(data);
            let options = {
                weekday: "long",
                year: "numeric",
                month: "long",
                day: "numeric",
            };
            let eventDate = new Date(eventData.start_time);
            let startTime = eventDate.toLocaleTimeString([], {
                hour: "2-digit",
                minute: "2-digit",
            });

            let startDate = eventDate.toLocaleDateString("en-US", options);

            let eventEndDate = new Date(eventData.end_time);
            let endDate = eventEndDate.toLocaleDateString("en-US", options);
            let endTime = eventEndDate.toLocaleTimeString([], {
                hour: "2-digit",
                minute: "2-digit",
            });
            setDateTime({
                startDate,
                endDate,
                startTime,
                endTime,
            });
        };
        fetchEvent();
    }, [currentEvent]);

    return (
        <Container>
            <Link to="/events">
                <Button>
                    <LeftIcon stroke={theme.primary} />
                    Back to Events
                </Button>
            </Link>
            <MainInfo>
                <EventImages>
                    <MainImage
                        src="https://source.unsplash.com/random/250x250/?party"
                        alt={"image"}></MainImage>
                </EventImages>

                <EventDetail>
                    <h1>{eventData ? eventData.name : "Loading Event  "}</h1>
                    <h2>
                        by{" "}
                        {eventData ? eventData.host_name : "Loading Host Name"}
                    </h2>
                    <Details>
                        <h3>Date: </h3>
                        <p>
                            {dateTime
                                ? dateTime.startDate + "-" + dateTime.endDate
                                : "Loading dates"}
                        </p>
                    </Details>
                    <Details>
                        <h3>Time: </h3>
                        <p>
                            {dateTime
                                ? dateTime.startTime + "-" + dateTime.endTime
                                : "Loading times"}
                        </p>
                    </Details>
                    <Details>
                        <h3>People Interested: </h3>
                        <Stats>
                            <p>{eventData ? eventData.num_interested : "0"}</p>
                        </Stats>
                    </Details>
                    <Details>
                        <h3>People Interested: </h3>
                        <Stats>
                            <p>{eventData ? eventData.num_attending : "0"}</p>
                        </Stats>
                    </Details>

                    <Description>
                        <h3>Description</h3>
                        <p>
                            {eventData
                                ? eventData.description
                                : "Loading description..."}
                        </p>
                    </Description>

                    {!going && (
                        <Button
                            primary
                            onClick={() => {
                                setGoing((curr) => !curr);
                            }}>
                            <Going />
                            <p>Attend Event</p>
                        </Button>
                    )}

                    {going && (
                        <Button
                            primary
                            onClick={() => {
                                setGoing((curr) => !curr);
                            }}>
                            <NotGoing />
                            <p>Not Going</p>
                        </Button>
                    )}
                </EventDetail>
            </MainInfo>
        </Container>
    );
};

export default EventPage;

const Container = styled.div`
    display: flex;
    flex-direction: column;
    margin: 1em 0;
    h3 {
        font-weight: 700;
    }
`;

const MainInfo = styled.div`
    display: flex;
    margin: 40px;
    flex-direction: row;
    justify-content: flex-start;
    @media (max-width: 1000px) {
        flex-wrap: wrap;
        margin: 20px;
        justify-content: center;
    }
`;

const EventImages = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin: 20px;
    @media (max-width: 1000px) {
        flex-wrap: wrap;
        flex-direction: column;
        margin: 10px;
    }
`;

const MainImage = styled.img`
    width: 600px;
    height: 600px;
    margin: 10px;
    border: 2px solid rgba(68, 68, 68, 0.1);
    padding: 1em;

    @media (max-width: 1000px) {
        width: 300px;
        height: 300px;
        margin: 5px;
    }
    @media (max-width: 350px) {
        width: 85vw;
    }
`;

const EventDetail = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    margin: 30px 20px;
    h1 {
        font-size: 2em;
        font-weight: 700;
    }
    h2 {
        font-size: 1em;
        font-weight: 700;
        //color: ${theme.primary};
    }

    h3 {
        margin: 0 1em 1em 0;
    }
    @media (max-width: 1000px) {
        h1 {
            font-size: 1.5em;
        }
        h2 {
            font-size: 1em;
        }
        h3 {
            margin: 0 0.5em 0.5em 0;
        }
    }
`;

const Description = styled.div`
    display: flex;
    flex-direction: column;
    padding: 1em 0;
    h3 {
        margin-bottom: 0.8em;
    }
`;

const Details = styled.div`
    display: flex;
    flex-direction: row;
`;

const Stats = styled.div`
    width: 2em;
    height: 2em;
    margin: 0 20px 0 0;
    padding: 20px;
    border: ${theme.primary};
    border-radius: 50px;
    background-color: ${theme.primary};
    p {
        font-size: 0.8em;
        color: white;
    }
`;