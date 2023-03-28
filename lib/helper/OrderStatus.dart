enum OrderStatus {
  // ignore: constant_identifier_names
  NewOrder,
  // ignore: constant_identifier_names
  InProgress,
  // ignore: constant_identifier_names
  Completed,
  // ignore: constant_identifier_names
  Cancelled,
}

String getStatusName(OrderStatus status) {
  String result = "";
  switch(status) {
    case OrderStatus.NewOrder:
      result = "Pesanan Baru";
    break;
    case OrderStatus.InProgress:
      result = "Sedang diproses";
    break;
    case OrderStatus.Completed:
      result = "Selesai";
      break;
    case OrderStatus.Cancelled:
      result = "Batal";
      break;
    default:
      result = "Tidak Diketahui";
    break;
  }
  return result;
}

int getStatusCode(OrderStatus status) {
  int result = 1;
  switch(status) {
    case OrderStatus.NewOrder:
      result = 1;
      break;
    case OrderStatus.InProgress:
      result = 2;
      break;
    case OrderStatus.Completed:
      result = 200;
      break;
    case OrderStatus.Cancelled:
      result = 3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}