import 'package:sks/helper/app_export.dart';

class NewBookingController extends GetxController {
  TextEditingController pol = TextEditingController();
  TextEditingController pod = TextEditingController();
  TextEditingController commodity = TextEditingController();
  TextEditingController containerQuantity = TextEditingController();
  TextEditingController sizeType = TextEditingController();
  TextEditingController vessel = TextEditingController();
  TextEditingController payable = TextEditingController();
  TextEditingController additionalCharges = TextEditingController();
  TextEditingController podTariff = TextEditingController();
  TextEditingController forwarder = TextEditingController();
  TextEditingController lineCode = TextEditingController();
  TextEditingController buying = TextEditingController();
  TextEditingController trade = TextEditingController();
  TextEditingController importExport = TextEditingController();
  TextEditingController instructions = TextEditingController();
  TextEditingController shippername = TextEditingController();
  TextEditingController shipperOrganization = TextEditingController();
  TextEditingController clearingAgent = TextEditingController();
  TextEditingController marketingPerson = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  var loading = false.obs;
  DashboardController dashboardController = Get.find<DashboardController>();
  List<DropDownValue>? polList = [DropDownValue()].obs;
  List<DropDownValue>? podList = [DropDownValue()].obs;
  List<DropDownValue>? forwarderList = [DropDownValue()].obs;
  List<DropDownValue>? lineCodeList = [DropDownValue()].obs;
  List<DropDownValue>? shipperList = [DropDownValue()].obs;
  List<DropDownValue>? tradeList = [DropDownValue()].obs;
  var selectedPol = DropDownValue();
  var selectedPod = DropDownValue();
  var selectedForwarder = DropDownValue();
  var selectedLineCode = DropDownValue();
  var selectedShipper = DropDownValue();
  var selectedTrade = DropDownValue();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  var currentStep = 0.obs;

  @override
  void onInit() {
    // pol.text = "Karachi";
    // pod.text = 'Dubai';
    // commodity.text = "Metal";
    // containerQuantity.text = '2';
    // sizeType.text = '20ft';
    // vessel.text = 'Atlantis';
    // payable.text = '20000';
    // additionalCharges.text = '300';
    // podTariff.text = '500';
    // forwarder.text = 'Aslam';
    // lineCode.text = '2210';
    // buying.text = 'Dont know';
    // trade.text = 'Dont know';
    // importExport.text = 'Export';
    // instructions.text = 'Keep it dry';
    // shippername.text = 'Batool Khan';
    // shipperOrganization.text = 'Steel Mill';
    // clearingAgent.text = 'Kamran Shah';
    // marketingPerson.text = 'Anas Kareem';
    // email.text = 'batool.khan@gmail.com';
    // contactNo.text = '03323992929';

    polList = dashboardController.bookingDropDetails.pol;
    podList = dashboardController.bookingDropDetails.pod;
    forwarderList = dashboardController.bookingDropDetails.forwarder;
    lineCodeList = dashboardController.bookingDropDetails.lineCode;
    shipperList = dashboardController.bookingDropDetails.shipper;
    tradeList = dashboardController.bookingDropDetails.trade;
    // print(polList![0].name);
    for (var node in focusNodes) {
      node.addListener(() {});
    }
    // TODO: implement onInit
    super.onInit();
  }

  void onSubmit() {
    print("Send dara to server");
  }

  void newBookingService() {
    loading.value = true;
    // var parameters = {
    //   constUserID: dashboardController.userInfo.info!.userId,
    //   constPolId: selectedPol.id,
    //   constPodId: selectedPod.id,
    //   constCommodity: commodity.text,
    //   constContainerQuantity: containerQuantity.text,
    //   constSizeOrType: sizeType.text,
    //   constVessel: vessel.text,
    //   constPayableAtPOL: payable.text,
    //   constAdditionalCharges: additionalCharges.text,
    //   constPodTariff: podTariff.text,
    //   constForwarderId: selectedForwarder.id,
    //   constLineCodeId: selectedLineCode.id,
    //   constBuying: buying.text,
    //   constTradeId: selectedTrade.id,
    //   constImportExport: importExport.text,
    //   constInstructions: instructions.text,
    //   constShipperId: selectedShipper.id,
    //   constShipperOrganization: shipperOrganization.text,
    //   constClearingAgent: clearingAgent.text,
    //   constMarketingPerson: marketingPerson.text,
    //   constEmailAddress: email.text,
    //   constContactNo: contactNo.text,
    // };

    var parameters = {
      "podId": "1",
      "polId": "1",
      "lineCodeId": "1",
      "forwarderId": 1,
      "tradeId": 1,
      "shipperId": 1,
      "commodity": "Commodity Name",
      "containerQuantity": "5",
      "sizeOrType": "50 by 50",
      "vessel": "vessel",
      "payableAtPOL": "52.22",
      "additionalCharges": "87.99",
      "podTeriff": "65",
      "buying": "buing",
      "importOrExport": "import",
      "instructions": "need extra precautions",
      "shipperOrganization": "sk",
      "clearingAgent": "rehman",
      "marketingPerson": "sheikh",
      "emailAddress": "sheikh@gmail.com",
      "contactno": "03336669988",
      "userId": 10000009
    };

    debugPrint("parameters $parameters");

    ApiProvider()
        .postObject(url: ApiProvider.newBooking, body: parameters)
        .then((onValue) async {
      var response = GeneralResponseModel<LoginResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        Get.dialog(DialogWidget(
            dialogText: 'Booking Submitted Successfully!',
            scondText:
                'Your booking has been submitted for the approval, you can see your booking in pending bookings.',
            blueBtnText: 'Dashboard',
            blueBtnfunc: () {
              Get.offAll(DashboardView());
            },
            greyBtnText: 'Pending Bookings',
            greyBtnfunc: () {
              Get.offAll(() => DashboardView());
              Get.to(() => BookingsView());
            }));
      } else {
        Get.dialog(AlertDialogCustom(
            title: 'Alert', message: '${response.response?.responseMessage}'));
      }
    }, onError: (error) {
      Get.dialog(AlertDialogCustom(title: 'Alert', message: '$error'));
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
