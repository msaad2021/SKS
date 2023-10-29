import 'dart:convert';

NewBookingDropDetails newBookingDropDetailsFromJson(String str) =>
    NewBookingDropDetails.fromJson(json.decode(str));

String newBookingDropDetailsToJson(NewBookingDropDetails data) =>
    json.encode(data.toJson());

class NewBookingDropDetails {
  NewBookingDropDetails({
    this.pol,
    this.pod,
    this.forwarder,
    this.lineCode,
    this.trade,
    this.shipper,
  });

  List<DropDownValue>? pol;
  List<DropDownValue>? pod;
  List<DropDownValue>? forwarder;
  List<DropDownValue>? lineCode;
  List<DropDownValue>? trade;
  List<DropDownValue>? shipper;

  factory NewBookingDropDetails.fromJson(Map<String, dynamic> json) =>
      NewBookingDropDetails(
        pol: List<DropDownValue>.from(
            json["pol"].map((x) => DropDownValue.fromJson(x))),
        pod: List<DropDownValue>.from(
            json["pod"].map((x) => DropDownValue.fromJson(x))),
        forwarder: List<DropDownValue>.from(
            json["forwarder"].map((x) => DropDownValue.fromJson(x))),
        lineCode: List<DropDownValue>.from(
            json["lineCode"].map((x) => DropDownValue.fromJson(x))),
        trade: List<DropDownValue>.from(
            json["trade"].map((x) => DropDownValue.fromJson(x))),
        shipper: List<DropDownValue>.from(
            json["shipper"].map((x) => DropDownValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pol": List<dynamic>.from(pol!.map((x) => x.toJson())),
        "pod": List<dynamic>.from(pod!.map((x) => x.toJson())),
        "forwarder": List<dynamic>.from(forwarder!.map((x) => x.toJson())),
        "lineCode": List<dynamic>.from(lineCode!.map((x) => x.toJson())),
        "trade": List<dynamic>.from(trade!.map((x) => x.toJson())),
        "shipper": List<dynamic>.from(shipper!.map((x) => x.toJson())),
      };
}

class DropDownValue {
  DropDownValue({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory DropDownValue.fromJson(Map<String, dynamic> json) => DropDownValue(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
