import 'package:sks/helper/app_export.dart';

class NoteDetailController extends GetxController {
  //
  var note = Note().obs;
  var isLoading = false.obs;
  var isCommentLoading = false.obs;
  List<Comment> comments = [Comment()].obs;
  TextEditingController commentController = TextEditingController();
  FocusNode focusNode = FocusNode();
  DashboardController dashboardController = Get.find<DashboardController>();

  @override
  void onInit() {
    note.value = Get.arguments;
    getCommentsService();
    // TODO: implement onInit
    super.onInit();
  }

  void getCommentsService() {
    isLoading.value = true;
    ApiProvider()
        .get(url: "${ApiProvider.getNoteComments}?Id=${note.value.noteId}")
        .then((onValue) async {
      var response =
          GeneralResponseModel<NoteCommentsResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        comments = response.result!.comments!;
        //

      } else {
        comments = [];
        //
      }
    }, onError: (error) {}).whenComplete(() {
      isLoading.value = false;
      print(isLoading.value);
    });
  }

  void addNoteCommentService() {
    isCommentLoading.value = true;
    var parameters = {
      constNoteId: note.value.noteId,
      constUserID: dashboardController.userInfo.info!.userId,
      constComment: commentController.text
    };
    debugPrint("parameters $parameters");
    ApiProvider()
        .postObject(url: ApiProvider.addNoteComments, body: parameters)
        .then((onValue) async {
      var response = GeneralResponseModel<LoginResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        Comment newComment = Comment(
          comments: commentController.text,
          commentUserName: dashboardController.userInfo.info!.firstName! +
              dashboardController.userInfo.info!.lastName!,
          commentUserDesignation:
              dashboardController.userInfo.info!.designation,
          commentUserProfileImage:
              dashboardController.userInfo.info!.profileImage,
        );
        comments.add(newComment);
        commentController.text = '';
        //
      } else {
        Get.dialog(AlertDialogCustom(
            title: 'Alert', message: '${response.response?.responseMessage}'));
      }
    }, onError: (error) {
      Get.dialog(AlertDialogCustom(title: 'title', message: '$error'));
    }).whenComplete(() {
      isCommentLoading.value = false;
    });
  }
}
