import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DataTableRequest {
  int? draw;
  int? page;
  int? length;
  List<Columns>? columns;
  List<Orders>? orders;
  Search? search;

  DataTableRequest({this.draw, this.page, this.length = 10, this.columns, this.orders, this.search});

  DataTableRequest.fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    page = json['page'];
    length = json['length'];
    if (json['columns'] != null) {
      columns = <Columns>[];
      json['columns'].forEach((v) {
        columns!.add(Columns.fromJson(v));
      });
    }
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
    search = json['search'] != null ? Search.fromJson(json['search']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['draw'] = draw;
    data['page'] = page;
    data['length'] = length;
    if (columns != null) {
      data['columns'] = columns!.map((v) => v.toJson()).toList();
    }
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    if (search != null) {
      data['search'] = search!.toJson();
    }
    return data;
  }
}

class Columns {
  String? data;
  String? name;
  bool? searchable;
  bool? orderable;
  String? searchValue;
  bool? searchRegex;

  Columns({
    this.data,
    this.name,
    this.searchable = false,
    this.orderable = false,
    this.searchValue = "",
    this.searchRegex = false
  });

  Columns.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    name = json['name'];
    searchable = json['searchable'];
    orderable = json['orderable'];
    searchValue = json['searchValue'];
    searchRegex = json['searchRegex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['name'] = name;
    data['searchable'] = searchable;
    data['orderable'] = orderable;
    data['searchValue'] = searchValue;
    data['searchRegex'] = searchRegex;
    return data;
  }
}

class Orders {
  String? column;
  String? direction;

  Orders({this.column, this.direction});

  Orders.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column'] = column;
    data['direction'] = direction;
    return data;
  }
}

class Search {
  String? searchValue;
  bool? searchRegex;

  Search({this.searchValue = "", this.searchRegex = false});

  Search.fromJson(Map<String, dynamic> json) {
    searchValue = json['searchValue'];
    searchRegex = json['searchRegex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchValue'] = searchValue;
    data['searchRegex'] = searchRegex;
    return data;
  }
}
