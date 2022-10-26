import React from "react";

const FreeDelivery = ({ total }) => {
  function checkTotal() {
    const isNotANumber = Number.isNaN(total);
    if (isNotANumber) {
      return null;
    }
    if (total >= 100) {
      return "Your delivery is now free";
    }
    return `You are ${(100 - total).toFixed(2)} from free delivery`;
  }
  return <div>{checkTotal()}</div>;
};

export default FreeDelivery;
