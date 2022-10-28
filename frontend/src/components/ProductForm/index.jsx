import React, { useEffect, useState } from "react";
import { Redirect, useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import _ from "lodash";
import { TextField } from "../Reusable/Input";
import Button from "../Reusable/Button";
import theme from "../Reusable/Colors";
import { AddIcon, LineCloseIcon } from "../../images/icons";
// import { deleteImage } from "../axios/deletes";
import { clearFormInputs, setFormInputs } from "../../redux/actions/Forms";
import setImages from "../../redux/actions/Images";
import {
  Form,
  Instruction,
  RowContainer,
  ColorDiv,
  SizeDiv,
  ImagesDiv,
  ImageUpload,
  ImageList,
  Container,
  Error
} from "./styledComponents";
import setVisible from "../../redux/actions/Modals";
import mapColors from "./maps/MapColors";
import mapSizes from "./maps/MapSizes";
import mapImages from "./maps/MapImages";
import loadPage from "./functions/loadPage";
import ImageInput from "./ImageInput";
import ColourModal from "./ColourModal";
import SizeModal from "./SizeModal";
import submitData from "./submitData";

import EditStockTable from "../../pages/Artist/Dashboard/EditStockTable";

import StockTable from "../../pages/Artist/Dashboard/StockTable";
import setRedirect from "../../redux/actions/Redirects";
import StyledLink from "../Reusable/Link";

const ProductForm = (props) => {
  const { type } = props;
  const dispatch = useDispatch();
  const input = useSelector((state) => state.formInputs.product);
  const images = useSelector((state) => state.images.productForm);
  const modalToggle = useSelector((state) => state.modalVisibility.productForm);

  const redirect = useSelector((state) => state.redirect.productForm);
  const formError = useSelector((state) => state.formErrors.product.form);
  const params = useParams();

  const [stock, setStock] = useState([]);
  const [quant, setQuant] = useState(null);

  const { id } = params;

  useEffect(() => {
    function clearField() {
      window.scrollTo({
        top: 0,
        left: 0,
        behavior: "smooth"
      });
      dispatch(clearFormInputs("product"));
      dispatch(setImages("productForm", []));
    }
    loadPage(id, dispatch, type);
    return () => {
      dispatch(setRedirect("productForm", ""));
      clearField();
    };
  }, [dispatch, id, type]);

  const setColorLabelAndValue = () => {
    const colorToAdd = document.querySelector("#colorToAdd").value;
    const colorLabelToAdd = document.querySelector("#colorLabelToAdd").value;
    const temp = {
      label: colorLabelToAdd,
      value: colorToAdd
    };
    if (!input.colours) {
      dispatch(setFormInputs("product", "colours", [temp]));
    } else if (input.colours.length < 6) {
      dispatch(setFormInputs("product", "colours", [...input.colours, temp]));
    }
  };
  const setSizeValue = () => {
    const sizeLabelToAdd = document.querySelector("#sizeLabelToAdd");
    const priceToAdd = document.querySelector("#priceToAdd").value;
    const sizeDropDown = document.querySelector("#sizeDropDown").value;
    const costToAdd = document.querySelector("#costToAdd").value;
    const temp = {
      label: sizeDropDown === "N" ? sizeLabelToAdd.value : sizeDropDown,
      price: priceToAdd,
      cost: costToAdd
    };

    if (!input.sizes) {
      dispatch(setFormInputs("product", "sizes", [temp]));
    } else if (input.sizes.length < 5) {
      dispatch(setFormInputs("product", "sizes", [...input.sizes, temp]));
    }
  };
  useEffect(() => {
    if (input.colours !== undefined && input.sizes !== undefined) {
      setStock(input);
    }
  }, [input]);

  return redirect ? (
    <Redirect to={redirect} />
  ) : (
    <Form>
      <Instruction>
        Add your products name!
        <br />
        <br />
        Set a base price, you can add an additional cost for different sizes
        later on.
      </Instruction>
      <RowContainer>
        <TextField
          multi={false}
          tests={[
            {
              test: (theInput) => theInput.length < 1,
              error: "Required"
            },
            {
              test: (theInput) => theInput.length < 3,
              error: "Minimum 3 characters."
            },
            {
              test: (theInput) => theInput.length > 45,
              error: "Title too long"
            }
          ]}
          label="Product Name"
          required
          form="product"
          name="title"
        />
        <TextField
          multi={false}
          tests={[
            {
              test: (theInput) => Number.isNaN(theInput),
              error: "Numerical values only"
            },
            {
              test: (theInput) => theInput.length < 1,
              error: "Required"
            },
            {
              test: (theInput) => theInput && +theInput <= 0,
              error: "Minimum 0.01"
            }
          ]}
          label="Price"
          required
          form="product"
          name="price"
        />
      </RowContainer>
      <Instruction>
        Add a description of your product, let your customers know all the great
        things about it! <br />
        <br /> Let them know what materials you use to make your product!
      </Instruction>
      <RowContainer>
        <TextField
          multi
          tests={[
            {
              test: (theInput) => theInput.length < 10,
              error: "Minimum 10 characters"
            }
          ]}
          label="Description"
          required
          form="product"
          name="desc"
        />
        <TextField
          multi
          tests={[
            {
              test: (theInput) => theInput.length < 10,
              error: "Minimum 10 characters"
            }
          ]}
          label="Materials"
          form="product"
          name="materials"
        />
      </RowContainer>
      <Instruction>
        Choose the colour and size options that you want to offer for your
        product. <br /> <br /> You can add an additional cost for each different
        size.
      </Instruction>
      <RowContainer>
        <ColorDiv
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center"
          }}
        >
          <h2>Colours</h2>
          <div
            style={{
              display: "flex",
              width: "7em",
              justifyContent: "space-around",
              alignItems: "baseline"
            }}
          >
            <label htmlFor="oneColour">One colour</label>
            <input
              onChange={(e) => {
                dispatch(
                  setFormInputs("product", "oneColour", e.target.checked)
                );
                if (e.target.checked) {
                  dispatch(
                    setFormInputs("product", "colours", [
                      { label: "O", value: "#44444455" }
                    ])
                  );
                } else {
                  dispatch(setFormInputs("product", "colours", []));
                }
              }}
              id="oneColour"
              type="checkbox"
            />
          </div>
          <div
            style={{
              display: "flex",
              flexWrap: "wrap",
              width: "75%"
            }}
          >
            {input.colours && mapColors(input.colours, dispatch)}
          </div>

          <ColourModal
            modalToggle={modalToggle}
            dispatch={dispatch}
            setColorLabelAndValue={setColorLabelAndValue}
          />
          {input.oneColour ? null : (
            <Button
              secondary
              onClick={() => {
                dispatch(setVisible("productForm", "colours", true));
              }}
            >
              Add
              <AddIcon stroke={theme.primary} />
            </Button>
          )}
        </ColorDiv>
        <SizeDiv
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center"
          }}
        >
          <h2>Sizes</h2>
          <div
            style={{
              display: "flex",
              width: "7em",
              justifyContent: "space-around",
              alignItems: "baseline"
            }}
          >
            <label htmlFor="oneSize">One size</label>
            <input
              onChange={(e) => {
                dispatch(setFormInputs("product", "oneSize", e.target.checked));
                if (e.target.checked) {
                  dispatch(
                    setFormInputs("product", "sizes", [
                      { label: "O", price: 0 }
                    ])
                  );
                } else {
                  dispatch(setFormInputs("product", "sizes", []));
                }
              }}
              id="oneSize"
              type="checkbox"
            />
          </div>
          <div
            style={{
              display: "flex",
              flexWrap: "wrap",
              width: "75%"
            }}
          >
            {input.sizes &&
              input.sizes.length > 0 &&
              mapSizes(input.sizes, dispatch)}
          </div>
          <SizeModal
            modalToggle={modalToggle}
            dispatch={dispatch}
            setSizeValue={setSizeValue}
          />
          {input.oneSize ? null : (
            <Button
              secondary
              onClick={() => {
                dispatch(setVisible("productForm", "sizes", true));
              }}
            >
              Add
              <AddIcon stroke={theme.primary} />
            </Button>
          )}
        </SizeDiv>
      </RowContainer>
      <Instruction>Set the level of stock for each variation</Instruction>
      {type === "Edit" ? (
        <RowContainer>
          <EditStockTable item={stock} setter={setQuant} />
        </RowContainer>
      ) : (
        <RowContainer>
          <StockTable item={stock} setter={setQuant} />
        </RowContainer>
      )}

      <Instruction>
        Add some images of your product to be shown on your product page.
        <br /> <br /> Choose one image to be the thumbnail to show up in search
        results. <br />
        <br /> Images will be cropped to be 1:1{" "}
      </Instruction>
      <RowContainer>
        <ImagesDiv>
          <h2>Images</h2>
          <ImageUpload>
            {ImageInput(dispatch, images, "productForm")}
          </ImageUpload>
          <ImageList>{images && mapImages(images, dispatch)}</ImageList>
        </ImagesDiv>
      </RowContainer>
      <Instruction>
        Add your new product to the store! <br />
        <br />
        Or cancel if you&apos;ve changed your mind
      </Instruction>
      <RowContainer>
        <Container>
          <StyledLink to="/dashboard">
            <LineCloseIcon width="32" height="32" stroke={theme.primary} />
            Cancel
          </StyledLink>

          <Button
            primary
            onClick={() => {
              submitData(
                _.cloneDeep(input),
                _.cloneDeep(images),
                dispatch,
                _.cloneDeep(props),
                id,
                _.cloneDeep(quant)
              );
            }}
          >
            Submit
          </Button>
        </Container>
        {formError && <Error>{formError}</Error>}
      </RowContainer>
    </Form>
  );
};

export default ProductForm;
