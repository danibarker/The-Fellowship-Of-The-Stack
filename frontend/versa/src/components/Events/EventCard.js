import React, { useState } from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";
import imageTest from "../../images/imageTest.png";
import { Going, WishListIcon, Share, NotGoing } from "../../images/icons";
import Button from "../Reusable/Button";
import theme from "../Reusable/Colors";

const EventCard = ({ theEvent }) => {
    const [interested, setInterested] = useState(false);
    const [going, setGoing] = useState(false);

    let eventDate = new Date(theEvent.start_time);
    let startTime = eventDate.toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
    });
    let options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
    };
    let startDate = eventDate.toLocaleDateString("en-US", options);

    let eventEndDate = new Date(theEvent.end_time);
    let endTime = eventEndDate.toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
    });

    let endDate = eventEndDate.toLocaleDateString("en-US", options);

    return (
        <CardContainer>
            {theEvent.thumbnail ? (
                <Link to={`/events/${theEvent.id}`}>
                    <Thumbnail src={theEvent.thumbnail} />
                </Link>
            ) : (
                <Thumbnail src={imageTest} />
            )}
            <Link to={`/events/${theEvent.id}`}>
                <Name>{theEvent.name}</Name>
                <Host>{theEvent.host_name}</Host>
                <EventDate>
                    {startDate === endDate ? startDate : startDate - endDate}
                </EventDate>
                <Time>
                    {startTime} - {endTime}
                </Time>
                <Stats>
                    <NumInterested>
                        {theEvent.num_attendees} Interested
                    </NumInterested>
                    <NumGoing>{theEvent.num_attendees} Going</NumGoing>
                </Stats>
            </Link>
            <Actions>
                <ActionButton
                    onClick={() => {
                        setInterested((curr) => !curr);
                    }}>
                    {interested && (
                        <div>
                            <WishListIcon
                                onClick={() => setInterested(false)}
                                fill="#FF0000"
                                stroke="#FF0000"
                                width="33"
                                height="33"
                            />
                            <p>Added!</p>
                        </div>
                    )}
                    {!interested && (
                        <div>
                            <WishListIcon stroke={theme.primary} />
                        </div>
                    )}
                </ActionButton>
                <ActionButton
                    onClick={() => {
                        setGoing((curr) => !curr);
                    }}>
                    {!going && (
                        <div>
                            <Going stroke={theme.primary} />
                        </div>
                    )}
                    {going && <NotGoing />}
                </ActionButton>
                <ActionButton>
                    <Share stroke={theme.primary} />
                </ActionButton>
            </Actions>
        </CardContainer>
    );
};

export default EventCard;

const CardContainer = styled.div`
    margin: 25px;
    cursor: pointer;
`;

const Thumbnail = styled.img`
    width: 250px;
    height: 250px;
`;
const Name = styled.h2`
    width: 250px;
    margin-top: 10px;
`;
const Host = styled.h3`
    width: 250px;
    margin-top: 10px;
`;
const EventDate = styled.p`
    margin-bottom: 5px;
`;
const Time = styled.p``;
const Stats = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 250px;
`;
const NumInterested = styled.p``;
const NumGoing = styled.p``;
const Actions = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 250px;
`;

const ActionButton = styled(Button)`
    flex-direction: column;
    margin: 0;
    padding: 0;
    :hover,
    :focus,
    :active {
        transform: scale(1.05);
    }
    p {
        font-size: 0.5em;
    }
    div {
        svg {
            path {
                fill: ${(props) => props.fill};
            }
        }
    }
`;
