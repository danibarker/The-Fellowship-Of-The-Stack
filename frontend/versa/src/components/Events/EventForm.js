import React, { useEffect } from "react";
import styled from "styled-components";
import { useDispatch, useSelector } from "react-redux";
import axios from "axios";
import { Redirect, useParams } from "react-router";
import { FieldContainer, Input, Label, TextField } from "../Reusable/Input";
import Button from "../Reusable/Button";
import { setFormErrors } from "../../redux/actions/Errors";
import { setFormInputs, clearFormInputs } from "../../redux/actions/Forms";
import setImages from "../../redux/actions/Images";
import { getEventByID, getImagesByEID } from "../../axios/gets";
import {
  ImageList,
  ImagesDiv,
  ImageUpload
} from "../ProductForm/styledComponents";
import ImageInput from "../ProductForm/ImageInput";
import { mapImages, thumbImg } from "./mapImages";
import { createEvent } from "../../axios/posts";
import StyledLink from "../Reusable/Link";
import { LineCloseIcon } from "../../images/icons";
import theme from "../Reusable/Colors";
import { editEvent } from "../../axios/puts";

const options = [
  "Select one:",
  "Artist showcase",
  "Meetup",
  "Exhibition",
  "Other"
];

const statusOptions = ["Select one:", "Active", "Inactive", "Pending"];

const EventForm = (props) => {
  const params = useParams();
  const { type } = props;
  const { id } = params;
  const formError = useSelector((state) => state.formErrors.event.form);
  const input = useSelector((state) => state.formInputs.event);
  const images = useSelector((state) => state.images.eventForm);
  const redirect = useSelector((state) => state.redirect.eventForm);
  const dispatch = useDispatch();

    useEffect(() => {
        const getUserData = async () => {
            let data = await getEventByID(id);
            dispatch(setFormInputs("event", "name", data.title));
            dispatch(setFormInputs("event", "description", data.description));
            dispatch(setFormInputs("event", "capacity", data.capacity));
            dispatch(
                setFormInputs(
                    "event",
                    "startTime",
                    data.start_time.substr(0, data.start_time.length - 5)
                )
            );
            dispatch(
                setFormInputs(
                    "event",
                    "endTime",
                    data.end_time.substr(0, data.end_time.length - 5)
                )
            );
            dispatch(setFormInputs("event", "type", data.type));
            dispatch(setFormInputs("event", "location", data.location));
            dispatch(setFormInputs("event", "status", data.status));
            dispatch(setFormInputs("event", "type", data.type));

            let img = await getImagesByEID(id);
            console.log(img)
            dispatch(
                setImages(
                    "eventForm",
                    img.map((picture) => {
                        return {
                            image: `https://versabucket.s3.us-east-2.amazonaws.com/eventImages/${picture.filename}.jpeg`,
                            label: picture.label,
                            imageFile: "update",
                            size: "full",
                            filename: picture.filename,
                            id: picture.id
                        };
                    })
                )
            );
        };

        if (props.type === "Edit") {
            getUserData();
        }
        return () => {
            dispatch(clearFormInputs("event"));
        };
    }, [dispatch, props.type, id]);

    const submitData = (e) => {
        e.preventDefault();
        const eventInfo = {
            name: input.name,
            description: input.description,
            capacity: input.capacity,
            startTime: input.startTime,
            endTime: input.endTime,
            type: input.type,
            location: input.location,
            status: input.status,
        };

        const sendData = () => {
            if (props.type === "Add") {
                createEvent(eventInfo, images, thumbImg);
            } else {
                editEvent(eventInfo,images,id,thumbImg)
            }
        };
        let error = document.getElementById("error");
        if (!error) {
            sendData();
        } else {
            dispatch(setFormErrors("event", "Please check all input is valid"));
        }
    };

                    <select
                        value={input.status}
                        onChange={(e) => {
                            dispatch(
                                setFormInputs("event", "status", e.target.value)
                            );
                        }}>
                        {statusOptions.map((one) => {
                            return <option value={one}>{one}</option>;
                        })}
                    </select>
                    <p style={{placeSelf:"flex-start", textAlign: "left"}}>
                        Active: Allow people to see and register for your event
                        <br />
                        <br />
                        Inactive: Allow people to see your event and mark that
                        they are interested
                        <br />
                        <br />
                        Pending: You haven't finalized the details and don't
                        want the event to be visible to others
                    </p>
                </FieldContainer>
            </RowContainer>
            <Instruction>
                Post your event so people can see your event!
            </Instruction>
            <RowContainer>
                <Container>
                    <StyledLink to="/dashboard">
                        <LineCloseIcon
                            width="32"
                            height="32"
                            stroke={theme.primary}
                        />
                        Cancel
                    </StyledLink>
                    <Button primary onClick={submitData}>
                        Submit
                    </Button>
                </Container>
                {formError && <Error>{formError}</Error>}
            </RowContainer>
        </Form>
    );
};

export default EventForm;
const Form = styled.form`
  margin-top: 40px;
  grid-template-columns: 30% 65%;
  grid-template-rows: auto;
  display: grid;
  grid-column-gap: 5%;
  /* @media only screen and (min-width: 800px) {
        height: 95%; 
     } */
  @media (max-width: 600px) {
    grid-template-columns: 95%;
  }
`;
const RowContainer = styled.div`
  padding: 20px 0 20px 0;
  border-bottom: 2px dashed #ccc;
  grid-column: 2;
  @media (max-width: 600px) {
    grid-column: 1;
  }
`;

const Instruction = styled.div`
  padding: 20px 20px 20px 0;
  grid-column: 1;
  border-bottom: 2px dashed #ccc;
  text-align: left;
  display: flex;
  flex-direction: column;
  justify-content: center;
`;

const Container = styled.div`
  display: flex;
  justify-content: center;
`;

const Error = styled.p`
  color: red;
`;
