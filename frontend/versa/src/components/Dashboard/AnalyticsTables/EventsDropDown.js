import React, { useState } from "react";
import styled from "styled-components";
import { updateEventStatus } from "../../../axios/puts";
import theme from "../../Reusable/Colors";

const Status = styled.select`
    padding: 8px;
    outline: none;
    width: 100%;
    cursor: pointer;
    border: ${(props) =>
        props.border === true
            ? `2px solid #77dd77`
            : `2px solid ${theme.primary}`};
    :active,
    :hover,
    :focus {
        border: ${(props) =>
            props.border === true
                ? `2px solid #77dd77`
                : `2px solid ${theme.primaryHover}`};
    }
`;

const EventsDropDown = ({ eventStatus, eventID }) => {
    const statusOptions = [
        {
            value: "Active",
            label: "Active",
        },
        {
            value: "Inactive",
            label: "Inactive",
        },
        {
            value: "Pending",
            label: "Pending",
        },
    ];
    const [status, setStatus] = useState(eventStatus);
    const [confirmation, setConfirmation] = useState(false);

    const handleChange = (e) => {
        setStatus(e.target.value);
        setConfirmation(true);
        updateEventStatus(e.target.value, eventID);
    };
    return (
        <Status
            name="status"
            id="status"
            value={status}
            onChange={handleChange}
            border={confirmation}>
            {statusOptions.map((option) => (
                <>
                    <option value={option.value}>{option.label}</option>
                </>
            ))}
        </Status>
    );
};

export default EventsDropDown;
