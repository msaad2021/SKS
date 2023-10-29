import 'package:sks/helper/app_export.dart';

class AddParticipantController extends GetxController {
  final TextEditingController search = TextEditingController();
  var participantList = [].obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
  ];

  var participant = {
    "name": "Ahmed Shah",
    "department": "Sales",
  };

  @override
  void onInit() {
    fetchList();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchList() {
    participantList.add(participant);
    participantList.add(participant);
  }
}
