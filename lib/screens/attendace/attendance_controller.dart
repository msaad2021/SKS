import 'package:sks/helper/app_export.dart';

class AttendanceController extends GetxController {
  List<String> list = <String>[
    'January',
    'Feburary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  var attendance = {
    "date": "Thursday, 02/01/2022",
    'in': '9.00 am',
    'out': '5.00pm',
  };

  List<dynamic> attendanceList = [];

  var dropDownVal = ''.obs;

  @override
  void onInit() {
    dropDownVal.value = list.first;
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    attendanceList.add(attendance);
    // TODO: implement onInit
    super.onInit();
  }

  void attendanceListFromMonth(String month) {
    print("Selected Month is $month");
  }
}
