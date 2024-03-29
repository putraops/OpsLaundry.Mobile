enum ActiveStatus {
  // ignore: constant_identifier_names
  Active,
  // ignore: constant_identifier_names
  InActive,
}

String getStatusName(ActiveStatus status) {
  String result = "";
  switch(status) {
    case ActiveStatus.Active:
      result = "Aktif";
    break;
    case ActiveStatus.InActive:
      result = "Tidak Aktif";
    break;
    default:
      result = "Tidak Diketahui";
    break;
  }
  return result;
}

String getStatusNameByStatus(bool status) {
  String result = "";
  switch(status) {
    case true:
      result = "Aktif";
      break;
    case false:
      result = "Tidak Aktif";
      break;
    default:
      result = "Tidak Diketahui";
      break;
  }
  return result;
}

bool? getStatusCode(ActiveStatus? status) {
  bool? result = true;

  return result;
}