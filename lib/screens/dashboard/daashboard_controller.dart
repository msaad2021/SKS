import 'dart:convert';

import 'package:sks/helper/app_export.dart';

class DashboardController extends GetxController {
  LoginResponseModel userInfo = LoginResponseModel();
  NewBookingDropDetails bookingDropDetails = NewBookingDropDetails();
  final box = GetStorage();

  @override
  void onInit() {
    if (box.read(constSignInModel) != null) {
      userInfo = LoginResponseModel.fromJson(
          json.decode(box.read(constSignInModel)!.toString()));
      debugPrint(userInfo.info!.firstName);
    }
    newBookingDetails();
    // TODO: implement onInit
    super.onInit();
  }

  void newBookingDetails() {
    ApiProvider()
        .get(
            url:
                "${ApiProvider.newBookingDropDetails}?$constUserID=${userInfo.info?.userId}")
        .then((onValue) async {
      var response =
          GeneralResponseModel<NewBookingDropDetails>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        bookingDropDetails = response.result!;
        print(bookingDropDetails);
      } else {}
    }, onError: (error) {}).whenComplete(() {});
  }
}
