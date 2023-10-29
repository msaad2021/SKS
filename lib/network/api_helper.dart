// ignore_for_file: file_names, depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../helper/app_export.dart';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

class ApiProvider {
  var headers = {
    "Ocp-Apim-Subscription-Key": "d524ef4c88ef42768bd2bab911a7a10a",
  };
  var headersObject = {
    "Content-Type": "application/json",
    "Ocp-Apim-Subscription-Key": "d524ef4c88ef42768bd2bab911a7a10a",
  };

  var timeout = const Duration(seconds: 30);

  ///** Error messages
  String timeoutMessage =
      // "Something went wrong, please check your internet and try again later.\n\nStatus Code : TO 001";
      "Please check your internet and try again later.";
  static var mainUrl = kReleaseMode
      ? "https://skapi.codelabs.inc/api/"
      : "https://skapi.codelabs.inc/api/";
  //Signin
  static var logIn = "${mainUrl}Account/Login";
  static var forgotPassword = "${mainUrl}Account/ForgotPassword";
  static var resetPassword = "${mainUrl}Account/ChangePassword";
  static var newBooking = "${mainUrl}Booking/AddBooking";
  static var newBookingDropDetails = "${mainUrl}Booking/GetDropDownlist";
  static var getBookings = "${mainUrl}Booking/GetBookings";
  static var getNotes = "${mainUrl}Notes/GetNotes";
  static var getNoteComments = "${mainUrl}Notes/GetNoteComments";
  static var addNoteComments = "${mainUrl}Notes/AddNoteComment";

  Future<dynamic> get({required String url}) async {
    print("get url $url, headers $headers");
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(url), headers: headers).timeout(timeout);
      responseJson = _response(response);
      log("response get :$responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  Future<dynamic> post({required String url, dynamic body}) async {
    print("url $url");

    var responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: (body),
            headers: headers,
          )
          .timeout(timeout);
      responseJson = _response(response, url: url);
      log("response post $url : $responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  Future<dynamic> postObject({required String url, dynamic body}) async {
    // print("postObject url $url, headers $headers");

    var responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(body), headers: headersObject)
          .timeout(timeout);
      // log("response postObject :${json.encode(body)}");
      responseJson = _response(response);
      log("response postObject :$responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  dynamic _response(http.Response response, {String url = ""}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        throw FetchDataException(
            // "Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}"
            timeoutMessage);
    }
  }

//   Future<dynamic> uploadMultipleImage(
//       {List<XFile>? images,
//       List<String>? imagesName,
//       Map<String, dynamic>? parameters,
//       String? url}) async {
//     var dio = Dio();
//     var response;
//     var responseJson;
//     print("images.length ${images?.length}");
//     dio.options.headers = headers;
//     List<MultipartFile> imagesList = [];
//     for (var i = 0; i < images!.length; i++) {
//       if (images[i].path.isNotEmpty) {
//         imagesList.add(MultipartFile.fromFileSync(images[i].path,
//             filename: (images[i].path.contains(".pdf"))
//                 ? "${i + 1}.pdf"
//                 : "${i + 1}.jpg"));
//       }
//     }

//     FormData formData = FormData.fromMap(parameters!);

//     for (var i = 0; i < images.length; i++) {
//       if (images[i].path.isNotEmpty) {
//         formData.files.add(MapEntry(imagesName![i], imagesList[i]));
//       }
//     }
//     print("formdata fields=${formData.fields}");
//     print("formdata files=${formData.files}");
//     // print("formdata files.first=${formData.files.first}");

//     try {
//       response = await dio.post(
//         url!,
//         data: formData,
//         onReceiveProgress: (count, total) {
//           print("onRecieve: $count :: $total");
//         },
//       );

//       print("response  $response");

//       responseJson = json.decode(response.toString());
//     } on SocketException {
//       log("SocketException response  $response");

//       throw FetchDataException(
//           "Please check your internet and try again later.");
//     } on TimeoutException {
//       log("TimeoutException response  $response");

//       throw TimeOutExceptionC(timeoutMessage);
//     } on DioError catch (e) {
//       throw FetchDataException(
//           // "Something went wrong, please try again later.\n\n${e.message}"
//           timeoutMessage);
//     }
//     log("responseJson  uploadiamges $responseJson");
// // */
//     return responseJson;
//   }

  // void countrylistService(BuildContext context) {
  //   get(url: ApiProvider.countrylist).then((onValue) async {
  //     var response =
  //         GeneralResponseModel<CountryCityResponseModel>.fromJson(onValue);
  //     print("response ${response.result}");
  //     if (response.response?.responseCode == 0) {
  //       Provider.of<CountryCityResponseModel>(context, listen: false)
  //           .countriesCitiesPro(response.result?.countries ?? []);
  //     }
  //   });
  // }

  // void donorDashboardDataService(BuildContext context) {
  //   get(url: ApiProvider.donorDashboardData).then((onValue) async {
  //     var response =
  //         GeneralResponseModel<DonorDashboardDataResponseModel>.fromJson(
  //             onValue);
  //     print("response ${response.result}");
  //     if (response.response?.responseCode == 0) {
  //       Provider.of<DonorDashboardDataResponseModel>(context, listen: false)
  //           .dashboardDataPro(response.result?.dashboardData);
  //       Provider.of<DonorDashboardDataResponseModel>(context, listen: false)
  //           .dashboardSliderPro(response.result?.dashboardSlider);
  //     }
  //   });
  // }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class TimeOutExceptionC extends CustomException {
  TimeOutExceptionC([String? message]) : super(message, "");
}
