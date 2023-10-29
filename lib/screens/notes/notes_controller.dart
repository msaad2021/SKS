import 'package:sks/helper/app_export.dart';

class NotesController extends GetxController {
  TextEditingController search = TextEditingController();
  var isLoading = false.obs;
  DashboardController dashboardController = Get.find<DashboardController>();
  List<Note> notesList = [Note()].obs;

  @override
  void onInit() {
    getNotesService();
    // TODO: implement onInit
    super.onInit();
  }

  void getNotesService() {
    isLoading.value = true;
    var parameters = {
      constUserID: dashboardController.userInfo.info!.userId,
      constDepartmentId: 1,
    };
    debugPrint("parameters $parameters");
    ApiProvider().postObject(url: ApiProvider.getNotes, body: parameters).then(
        (onValue) async {
      var response =
          GeneralResponseModel<NotesListResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        notesList = response.result!.notesdata!;
        //
      } else {
        Get.dialog(AlertDialogCustom(
            title: 'Alert', message: '${response.response?.responseMessage}'));
      }
    }, onError: (error) {
      Get.dialog(AlertDialogCustom(title: 'title', message: '$error'));
    }).whenComplete(() {
      isLoading.value = false;
    });
  }
}
