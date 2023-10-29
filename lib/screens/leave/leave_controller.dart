import 'package:sks/helper/app_export.dart';

class LeaveController extends GetxController {
  // var leaveProcess = true.obs;
  double anualRemain = 20;
  double casualRemain = 30;
  double sickRemain = 10;
  double anualTotal = 30;
  double casualTotal = 30;
  double sickTotal = 30;

  // ProfileController profileController = Get.find<ProfileController>();
  // ProfileController profileController = Get.put(ProfileController());

  TextEditingController leaveType = TextEditingController();
  TextEditingController leaveReason = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController coveringPerson = TextEditingController();

  void onSubmit() {
    // profileController.name = leaveReason.text;
  }
}
