enum OrderStatus {
  ///今预到
  tCheckIn,

  ///今预离
  tCheckOut,

  ///待分房
  toBeHousing,

  ///待确认
  toBeConfirmed,

  ///全部
  all,
}

const OrderStatusValues = {
  OrderStatus.tCheckIn: 1,
  OrderStatus.tCheckOut: 2,
  OrderStatus.toBeHousing: 3,
  OrderStatus.toBeConfirmed: 4,
  OrderStatus.all: 0,
};
