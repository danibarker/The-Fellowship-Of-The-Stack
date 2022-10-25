import React from "react";

const TextArea = ({ setter, getter }) => (
  <div style={{ gridColumn: "4 / 6", display: "flex", flexDirection: "row" }}>
    <label htmlFor="deliveryTextBox">
      Additional Order/Delivery Instructions:
    </label>
    <textarea
      value={getter}
      id="deliveryTextBox"
      name="deliveryInstructions"
      style={{ resize: "none", width: "200px" }}
      onChange={(e) => setter(e.target.value)}
    />
  </div>
);

export default TextArea;
