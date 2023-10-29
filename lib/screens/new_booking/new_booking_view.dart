import 'package:sks/screens/dashboard/dashboard_view.dart';

import '../../helper/app_export.dart';

class NewBookingView extends GetView<NewBookingController> {
  NewBookingView({super.key});

  String title = "Add new booking";

  final NewBookingController _controller = Get.put(NewBookingController());

  @override
  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(
            title: shippingDetailTitle(context),
            content: shippingDetails(context),
            isActive: controller.currentStep.value >= 0,
          ),
          Step(
            title: companyDetailTitle(context),
            content: companyDetails(context),
            isActive: controller.currentStep.value >= 1,
          ),
        ];

    return Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: AppbarWidget(title: title),
        body: Obx(
          () => Stepper(
            physics: const BouncingScrollPhysics(),
            type: StepperType.horizontal,
            steps: stepList(),
            margin: EdgeInsets.zero,
            elevation: 0,
            currentStep: controller.currentStep.value,
            onStepContinue: onStepContinue,
            onStepCancel: onStepCancel,
            onStepTapped: onStepTapped,
            controlsBuilder: controlsBuilder,
          ),
        ));
  }

  Widget controlsBuilder(context, details) {
    return Obx(() => Padding(
          padding: UIhelper.paddingHelper(context,
              top: 0, bottom: 65, right: 0, left: 0),
          child: Row(
            children: [
              Expanded(
                child: (controller.currentStep.value != 0)
                    ? DefaultButtonWidget(
                        onPressed: details.onStepCancel,
                        buttonText: 'Cancel',
                        btnColor: ColorConstant.gray50,
                        textColor: ColorConstant.gray600,
                      )
                    : Container(),
              ),
              SizedBox(
                width: getHorizontalSize(context, 62),
              ),
              Expanded(
                child: DefaultButtonWidget(
                  onPressed: controller.currentStep.value != 0
                      ? () {
                          controller.newBookingService();
                        }
                      : details.onStepContinue,
                  isLoading: controller.currentStep.value != 0
                      ? controller.loading.value
                      : false,
                  buttonText:
                      controller.currentStep.value != 0 ? "Submit" : "Next",
                ),
              ),
            ],
          ),
        ));
  }

  void onStepTapped(index) {
    controller.currentStep.value == index;
  }

  void onStepCancel() {
    controller.currentStep.value == 0 ? null : controller.currentStep.value--;
  }

  void onStepContinue() {
    if (controller.currentStep.value == 1) {
      // controller.onSubmit();
      // showDialog(
      //     // context: context,
      //     builder: (BuildContext context) => DialogWidget(
      //           blueBtnText: "Heyyyyyy",
      //           blueBtnfunc: () {},
      //           dialogText: 'Helooooooooooo',
      //           greyBtnfunc: () {},
      //         ));
      // Get.defaultDialog(
      //   content: Image.asset(ImageConstant.dialogueSuccessLogo),
      //   contentPadding: EdgeInsets.zero,
      //   titlePadding: EdgeInsets.zero,
      //   radius: 10,
      //   title: '',
      //   middleText: '',
      //   actions: [],
      // );

    } else {
      controller.currentStep.value++;
    }
  }

  Text companyDetailTitle(BuildContext context) {
    return Text(
      "CompanyDetails",
      style: AppStyle.txtRobotoRomanBold15(context),
    );
  }

  Text shippingDetailTitle(BuildContext context) {
    return Text(
      "ShippingDetails",
      style: AppStyle.txtRobotoRomanBold15(context),
    );
  }

  Widget shippingDetails(BuildContext context) {
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: 40, right: 0, left: 0),
      child: Form(
        child: Column(
          children: [
            BottomSheetTextFieldWidget(
                controller: controller.pol,
                focusNode: controller.focusNodes[0],
                list: controller.polList,
                selected: (value) {
                  controller.selectedPol = value as DropDownValue;
                },
                hintText: "Port of Loading (POL)"),
            BottomSheetTextFieldWidget(
                controller: controller.pod,
                focusNode: controller.focusNodes[1],
                list: controller.podList,
                selected: (value) {
                  controller.selectedPod = value as DropDownValue;
                },
                hintText: "Port of Delivery (POD)"),
            TextFormFieldWidget(
              controller: controller.commodity,
              hint: "Commodity",
              focusNode: controller.focusNodes[2],
            ),
            TextFormFieldWidget(
              controller: controller.containerQuantity,
              hint: "Container Quantity",
              focusNode: controller.focusNodes[3],
            ),
            TextFormFieldWidget(
              controller: controller.sizeType,
              hint: "Size/Type",
              focusNode: controller.focusNodes[4],
            ),
            TextFormFieldWidget(
              controller: controller.vessel,
              hint: "Vessel/Voyage",
              focusNode: controller.focusNodes[5],
            ),
            TextFormFieldWidget(
              controller: controller.payable,
              hint: "Payable at POL",
              focusNode: controller.focusNodes[6],
            ),
            TextFormFieldWidget(
              controller: controller.additionalCharges,
              hint: "Additional Charges / All In",
              focusNode: controller.focusNodes[7],
            ),
            TextFormFieldWidget(
              controller: controller.podTariff,
              hint: "Collection over POD Tariff",
              focusNode: controller.focusNodes[8],
            ),
            BottomSheetTextFieldWidget(
                controller: controller.forwarder,
                focusNode: controller.focusNodes[9],
                list: controller.forwarderList,
                selected: (value) {
                  controller.selectedForwarder = value as DropDownValue;
                },
                hintText: "Forwarder"),
            BottomSheetTextFieldWidget(
                controller: controller.lineCode,
                focusNode: controller.focusNodes[10],
                list: controller.lineCodeList,
                selected: (value) {
                  controller.selectedLineCode = value as DropDownValue;
                },
                hintText: "Line Code"),
            TextFormFieldWidget(
              controller: controller.buying,
              hint: "Buying (if forwarding)",
              focusNode: controller.focusNodes[11],
            ),
            BottomSheetTextFieldWidget(
                controller: controller.trade,
                focusNode: controller.focusNodes[12],
                list: controller.tradeList,
                selected: (value) {
                  controller.selectedTrade = value as DropDownValue;
                },
                hintText: "Trade"),
            BottomSheetTextFieldWidget(
                controller: controller.importExport,
                focusNode: controller.focusNodes[13],
                hintText: "Export/Import"),
            TextFormFieldWidget(
              controller: controller.instructions,
              hint: "Special Instructions",
              focusNode: controller.focusNodes[14],
              manxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget companyDetails(BuildContext context) {
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: 40, right: 0, left: 0),
      child: Form(
        child: Column(
          children: [
            BottomSheetTextFieldWidget(
                controller: controller.shippername,
                focusNode: controller.focusNodes[15],
                list: controller.shipperList,
                selected: (value) {
                  controller.selectedShipper = value as DropDownValue;
                },
                hintText: "Shipper Name"),
            TextFormFieldWidget(
              controller: controller.shipperOrganization,
              hint: "Shipper Organization (optional)",
              focusNode: controller.focusNodes[16],
            ),
            TextFormFieldWidget(
              controller: controller.clearingAgent,
              hint: "Clearing Agent ",
              focusNode: controller.focusNodes[17],
            ),
            TextFormFieldWidget(
              controller: controller.marketingPerson,
              hint: "Marketing Person",
              focusNode: controller.focusNodes[18],
            ),
            TextFormFieldWidget(
              controller: controller.email,
              hint: "Email Address",
              focusNode: controller.focusNodes[19],
            ),
            TextFormFieldWidget(
              controller: controller.contactNo,
              hint: "Contact no.",
              focusNode: controller.focusNodes[20],
            ),
          ],
        ),
      ),
    );
  }
}
