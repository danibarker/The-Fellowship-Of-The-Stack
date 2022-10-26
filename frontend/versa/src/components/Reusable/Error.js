import styled from "styled-components";

const Error = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  font-size: 20px;
  font-weight: 600;
  z-index: 100;
`;

export default Error;
