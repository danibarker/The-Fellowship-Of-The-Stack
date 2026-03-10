const calcTotalStock = (item) =>
  item.stock.reduce((total, curr) => {
    // eslint-disable-next-line no-param-reassign
    total += curr.quantity;
    return total;
  }, 0);
export default calcTotalStock;
