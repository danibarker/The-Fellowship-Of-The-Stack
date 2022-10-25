import { Route, Redirect } from "react-router";
import Cookies from "universal-cookie";

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
