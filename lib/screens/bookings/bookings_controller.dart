import 'package:sks/helper/app_export.dart';

class BookingsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();
  DashboardController dashboardController = Get.find<DashboardController>();
  var isLoading = false.obs;

  List<BookingsDatum>? allBookings = [BookingsDatum()].obs;
  List<BookingsDatum>? pendingBookings = [BookingsDatum()].obs;
  List<BookingsDatum>? completedBookings = [BookingsDatum()].obs;
  List<BookingsDatum>? rejectedBookings = [BookingsDatum()].obs;

  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'All Bookings'),
    Tab(text: 'Pending'),
    Tab(text: 'Completed'),
    Tab(text: 'Rejected'),
  ];

  List<FocusNode> focusNodes = [
    FocusNode(),
  ];

  late TabController controller;

  var currentStep = 0.obs;

  @override
  void onInit() {
    controller = TabController(vsync: this, length: myTabs.length);
    getBookingsService();
    for (var node in focusNodes) {
      node.addListener(() {});
    }
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void sortBookings() {
    pendingBookings = allBookings!
        .where((element) => element.approvalStatus!.contains('Pending'))
        .toList();
    completedBookings = allBookings!
        .where((element) => element.approvalStatus!.contains('Approved'))
        .toList();
    rejectedBookings = allBookings!
        .where((element) => element.approvalStatus!.contains('Rejected'))
        .toList();
  }

  void getBookingsService() {
    isLoading.value = true;
    print(isLoading.value);
    ApiProvider()
        .get(
            url:
                "${ApiProvider.getBookings}?$constUserID=${dashboardController.userInfo.info!.userId}")
        .then((onValue) async {
      var response =
          GeneralResponseModel<BookingsDataResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        if (response.result!.bookingsData!.isNotEmpty) {
          allBookings = [];
          for (var element in response.result!.bookingsData!) {
            if (element.approvalStatus?.toLowerCase() == 'pending') {
              element.statusTxtColor = ColorConstant.blue801;
              element.statusBgColor = ColorConstant.teal50;
            } else if (element.approvalStatus?.toLowerCase() == 'approved') {
              element.statusTxtColor = ColorConstant.approvedGreen;
              element.statusBgColor = ColorConstant.gray102;
            } else {
              element.statusTxtColor = ColorConstant.redA200;
              element.statusBgColor = ColorConstant.red100;
            }
            allBookings!.add(element);
          }
        }

        sortBookings();
      } else {
        //
      }
    }, onError: (error) {}).whenComplete(() {
      isLoading.value = false;
      print(isLoading.value);
    });
  }
}
