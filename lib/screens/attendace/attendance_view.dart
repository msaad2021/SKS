import '../../helper/app_export.dart';

class AttendanceView extends GetView<AttendanceController> {
  AttendanceView({super.key});

  final AttendanceController _controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: AppbarWidget(
          title: "Attendance History",
          actions: [
            Padding(
              padding: UIhelper.paddingHelper(context,
                  top: 5, bottom: 0, right: 25, left: 0),
              child: DropdownButton<String>(
                underline: Container(),
                value: controller.dropDownVal.value,
                dropdownColor: ColorConstant.blue700,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: ColorConstant.whiteA700,
                ),
                iconSize: getSize(context, 20),
                elevation: 16,
                style: AppStyle.txtRobotoRomanRegular16WhiteA700(context),
                onChanged: (String? month) {
                  // This is called when the user selects an item.
                  // setState(() {
                  controller.dropDownVal.value = month!;
                  controller.attendanceListFromMonth(month);
                  // });
                },
                items: controller.list
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.attendanceList.length,
              padding: UIhelper.paddingHelper(context,
                  top: 25, bottom: 120, right: 19, left: 19),
              itemBuilder: (context, day) {
                return Container(
                  padding: UIhelper.paddingHelper(context,
                      top: 21, bottom: 17, right: 21, left: 21),
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius:
                          BorderRadius.circular(getSize(context, 11))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.attendanceList[day]['date'],
                        style: AppStyle.txtRobotoRomanBold16Black900(context),
                      ),
                      SizedBox(
                        height: getVerticalSize(context, 19),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.login,
                                size: getSize(context, 20),
                              ),
                              SizedBox(
                                width: getHorizontalSize(context, 7),
                              ),
                              // Text(
                              //   "Check in",
                              //   style: AppStyle.txtRobotoRomanRegular16Black900(
                              //       context),
                              // ),
                              SizedBox(
                                width: getHorizontalSize(context, 7),
                              ),
                              Text(
                                controller.attendanceList[day]['in'],
                                style: AppStyle.txtRobotoRomanBold16Black900(
                                    context),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.logout,
                                size: getSize(context, 20),
                              ),
                              SizedBox(
                                width: getHorizontalSize(context, 7),
                              ),
                              // Text(
                              //   "Check out",
                              //   style: AppStyle.txtRobotoRomanRegular16Black900(
                              //       context),
                              // ),
                              SizedBox(
                                width: getHorizontalSize(context, 7),
                              ),
                              Text(
                                controller.attendanceList[day]['out'],
                                style: AppStyle.txtRobotoRomanBold16Black900(
                                    context),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: getVerticalSize(context, 16),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: UIhelper.paddingHelper(context,
                    top: 0, bottom: 35, right: 19, left: 19),
                child: DefaultButtonWidget(
                  buttonText: "Request Leave",
                  onPressed: () {
                    Get.to(() => LeaveView());
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
