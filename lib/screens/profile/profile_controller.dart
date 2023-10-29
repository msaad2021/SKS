import 'package:sks/helper/app_export.dart';
import 'package:sks/screens/login/login_view.dart';

class ProfileController extends GetxController {
  var userInfo = LoginResponseModel().obs;
  DashboardController dashboardController = Get.find<DashboardController>();

  final box = GetStorage();
  // bool get isLoggedIn => box.read('userName') ?? false;

  String name = '';
  String department = '';

  @override
  void onInit() {
    userInfo.value = dashboardController.userInfo;
    // if (box.read(constSignInModel) != null) {
    //   userInfo.value = LoginResponseModel.fromJson(
    //       json.decode(box.read(constSignInModel)!.toString()));
    //   debugPrint(userInfo.value.info!.firstName);
    // }
    name = "BBRRRRRRRRRR";
    // TODO: implement onInit

    super.onInit();
  }

  void logOut() {
    dashboardController.box.remove(constSignInModel);
    Get.offAll(() => LoginView());
  }
}
