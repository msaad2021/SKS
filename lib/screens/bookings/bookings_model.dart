// To parse this JSON data, do
//
//     final bookingsDataResponseModel = bookingsDataResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../helper/app_export.dart';

BookingsDataResponseModel bookingsDataResponseModelFromJson(String str) =>
    BookingsDataResponseModel.fromJson(json.decode(str));

String bookingsDataResponseModelToJson(BookingsDataResponseModel data) =>
    json.encode(data.toJson());

class BookingsDataResponseModel {
  BookingsDataResponseModel({
    this.bookingsData,
  });

  List<BookingsDatum>? bookingsData;

  factory BookingsDataResponseModel.fromJson(Map<String, dynamic> json) =>
      BookingsDataResponseModel(
        bookingsData: List<BookingsDatum>.from(
            json["bookingsData"].map((x) => BookingsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookingsData":
            List<dynamic>.from(bookingsData!.map((x) => x.toJson())),
      };
}

class BookingsDatum {
  BookingsDatum({
    this.bookingId,
    this.pol,
    this.pod,
    this.forwarder,
    this.lineCode,
    this.trade,
    this.shipper,
    this.commodity,
    this.containerQuantity,
    this.sizeOrType,
    this.vessel,
    this.payableAtPol,
    this.additionalCharges,
    this.podTeriff,
    this.buying,
    this.importOrExport,
    this.instructions,
    this.shipperOrganization,
    this.clearingAgent,
    this.marketingPerson,
    this.emailAddress,
    this.contactno,
    this.approvalStatus,
    this.statusBgColor,
    this.statusTxtColor,
  });

  int? bookingId;
  String? pol;
  String? pod;
  String? forwarder;
  String? lineCode;
  String? trade;
  String? shipper;
  String? commodity;
  int? containerQuantity;
  String? sizeOrType;
  String? vessel;
  double? payableAtPol;
  double? additionalCharges;
  double? podTeriff;
  String? buying;
  String? importOrExport;
  String? instructions;
  String? shipperOrganization;
  String? clearingAgent;
  String? marketingPerson;
  String? emailAddress;
  String? contactno;
  String? approvalStatus;
  Color? statusBgColor;
  Color? statusTxtColor;

  factory BookingsDatum.fromJson(Map<String, dynamic> json) => BookingsDatum(
        bookingId: json["bookingId"],
        pol: json["pol"],
        pod: json["pod"],
        forwarder: json["forwarder"],
        lineCode: json["lineCode"],
        trade: json["trade"],
        shipper: json["shipper"],
        commodity: json["commodity"],
        containerQuantity: json["containerQuantity"],
        sizeOrType: json["sizeOrType"],
        vessel: json["vessel"],
        payableAtPol: json["payableAtPOL"].toDouble(),
        additionalCharges: json["additionalCharges"].toDouble(),
        podTeriff: json["podTeriff"].toDouble(),
        buying: json["buying"],
        importOrExport: json["importOrExport"],
        instructions: json["instructions"],
        shipperOrganization: json["shipperOrganization"],
        clearingAgent: json["clearingAgent"],
        marketingPerson: json["marketingPerson"],
        emailAddress: json["emailAddress"],
        contactno: json["contactno"],
        approvalStatus: json["approvalStatus"],
        statusBgColor: json["statusBgColor"],
        statusTxtColor: json["statusTxtColor"],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "pol": pol,
        "pod": pod,
        "forwarder": forwarder,
        "lineCode": lineCode,
        "trade": trade,
        "shipper": shipper,
        "commodity": commodity,
        "containerQuantity": containerQuantity,
        "sizeOrType": sizeOrType,
        "vessel": vessel,
        "payableAtPOL": payableAtPol,
        "additionalCharges": additionalCharges,
        "podTeriff": podTeriff,
        "buying": buying,
        "importOrExport": importOrExport,
        "instructions": instructions,
        "shipperOrganization": shipperOrganization,
        "clearingAgent": clearingAgent,
        "marketingPerson": marketingPerson,
        "emailAddress": emailAddress,
        "contactno": contactno,
        "approvalStatus": approvalStatus,
        "statusBgColor": statusBgColor,
        "statusTxtColor": statusTxtColor,
      };
}
