import React, { useState } from "react";
import styled from "styled-components";
import { addDriverID, removeDriverID } from "../../../axios/puts";
import theme from "../../Reusable/Colors";

const Status = styled.select`
    padding: 8px;
    outline: none;
    min-width: 150px;
    border-radius: 8px;
    cursor: pointer;
    border: 2px solid
        ${(props) =>
            props.border === true ? props.theme.green : props.theme.black};
    :active,
    :hover,
    :focus {
        border: 2px solid
            ${(props) =>
                props.border === true ? props.theme.green : props.theme.purple};
    }
`;

const DriversDropDown = ({ order }) => {
    const statusOptions = [
        {
            value: "Ready for Delivery",
            label: "Ready for Delivery",
        },
        {
            value: "Add to Deliveries",
            label: "Add to Deliveries",
        },
        {
            value: "Driver Assigned",
            label: "Available in Pickups",
        },
        {
            value: "Remove from Deliveries",
            label: "Remove from Deliveries",
        },
        // {
        //     value: "Removed from your deliveries",
        //     label: "Removed from your deliveries",
        // },
    ];
    const [status, setStatus] = useState(order.status);
    const [confirmation, setConfirmation] = useState(false);

    const handleChange = (e) => {
        if (e.target.value === "Add to Deliveries") {
            addDriverID(order.id);
            window.location.reload(false);
        } else if (e.target.value === "Remove from Deliveries") {
            removeDriverID(order.id);
            window.location.reload(false);
        }
        setStatus(e.target.value);
        setConfirmation(true);
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
                    <option value={option.value} key={option.value}>
                        {option.label}
                    </option>
                </>
            ))}
        </Status>
    );
};

export default DriversDropDown;
