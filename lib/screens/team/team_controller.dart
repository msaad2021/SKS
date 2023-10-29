import 'package:sks/helper/app_export.dart';

class TeamController extends GetxController {
  final TextEditingController search = TextEditingController();
  var teamList = [].obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
  ];

  var team = {
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
    teamList.add(team);
    teamList.add(team);
  }
}
