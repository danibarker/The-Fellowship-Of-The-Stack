/* eslint-disable react/jsx-props-no-spreading */
import { Redirect, Route } from "react-router";
import Cookies from "universal-cookie";
import React from "react";

const cookies = new Cookies();
const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route
    {...rest}
    render={(props) =>
      cookies.get("token") ? (
        <Component {...props} />
      ) : (
        <Redirect to="/account" />
      )
    }
  />
);

export default PrivateRoute;
