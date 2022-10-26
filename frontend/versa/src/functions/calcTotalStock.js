export const calcTotalStock = (item) => item.stock.reduce((total, curr) => {
    total += curr.quantity;
    return total;
  }, 0);
