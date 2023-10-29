import '../helper/app_export.dart';

class GeneralResponseModel<T> {
  Response? response;
  T? result;
  dynamic resultNoModel;
  List<T>? resultList;
  GeneralResponseModel({this.response, this.result});
  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
    resultNoModel = json['result'];
    try {
      if (T == LoginResponseModel) {
        result = json['result'] != null
            ? (LoginResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == NewBookingDropDetails) {
        result = json['result'] != null
            ? (NewBookingDropDetails.fromJson(json['result']) as T)
            : null;
      }
      if (T == BookingsDataResponseModel) {
        result = json['result'] != null
            ? (BookingsDataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == NotesListResponseModel) {
        result = json['result'] != null
            ? (NotesListResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == NoteCommentsResponseModel) {
        result = json['result'] != null
            ? (NoteCommentsResponseModel.fromJson(json['result']) as T)
            : null;
      }
    } catch (e) {
      print("Exception $e");
      result = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response?.toJson();
    }
    if (result != null) {
      // data['result'] = this.result.toJson();
      // data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Response {
  int? responseCode;
  String? responseMessage;

  Response({this.responseCode, this.responseMessage});

  Response.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    return data;
  }
}
