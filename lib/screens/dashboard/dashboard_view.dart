import '../../helper/app_export.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppBar(
        backgroundColor: ColorConstant.blue700,
        automaticallyImplyLeading: false,
        toolbarHeight: getVerticalSize(context, 116),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(getSize(context, 15)),
          bottomRight: Radius.circular(getSize(context, 15)),
        )),
        title: Row(
          children: [
            Image.asset(ImageConstant.dashboardImage),
            SizedBox(
              width: getHorizontalSize(context, 9),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sales",
                  style: AppStyle.txtRobotoRomanMedium20(context),
                ),
                Text(
                  "Sales Employee",
                  style: AppStyle.txtRobotoRomanRegular14(context),
                )
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProfileView());
            },
            child: ProfileImageWidget(
              width: 30,
            ),
            // child: CircleAvatar(
            //   radius: getSize(context, 15),
            //   backgroundColor: ColorConstant.whiteA700,
            //   child: Icon(
            //     Icons.person,
            //     size: getSize(context, 25),
            //   ),
            // ),
          ),
          SizedBox(
            width: getHorizontalSize(context, 21),
          )
        ],
      ),
      body: Container(
        padding: UIhelper.paddingHelper(context,
            top: 30, bottom: 35, right: 21, left: 21),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Activities",
                style: AppStyle.txtRobotoRomanMedium22(context),
              ),
              SizedBox(
                height: getVerticalSize(context, 29),
              ),
              Expanded(
                child: Row(
                  children: [
                    dashboardWidget(
                      context,
                      image: ImageConstant.bookingLogo,
                      text: "Bookings",
                      color: ColorConstant.bookingsColor,
                      onPressed: () {
                        Get.to(() => BookingsView());
                      },
                    ),
                    SizedBox(
                      width: getHorizontalSize(context, 14),
                    ),
                    dashboardWidget(
                      context,
                      image: ImageConstant.notesLogo,
                      text: "Notes",
                      color: ColorConstant.notesColor,
                      onPressed: () {
                        Get.to(() => NotesView());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(context, 29),
              ),
              Expanded(
                child: Row(
                  children: [
                    dashboardWidget(
                      context,
                      image: ImageConstant.calendarLogo,
                      text: "Calendar",
                      color: ColorConstant.blue801,
                      onPressed: () {
                        Get.to(() => CalendarView());
                      },
                    ),
                    SizedBox(
                      width: getHorizontalSize(context, 14),
                    ),
                    dashboardWidget(
                      context,
                      image: ImageConstant.attendanceLogo,
                      text: "Attendance",
                      color: ColorConstant.attendaceColor,
                      onPressed: () {
                        Get.to(() => AttendanceView());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(context, 29),
              ),
              Expanded(
                child: Row(
                  children: [
                    dashboardWidget(
                      context,
                      image: ImageConstant.leaveLogo,
                      text: "Apply Leave",
                      color: ColorConstant.leaveColor,
                      onPressed: () {
                        Get.to(() => LeaveView());
                      },
                    ),
                    SizedBox(
                      width: getHorizontalSize(context, 14),
                    ),
                    dashboardWidget(
                      context,
                      image: ImageConstant.teamLogo,
                      text: "Team",
                      color: ColorConstant.teamColor,
                      onPressed: () {
                        Get.to(() => TeamView());
                      },
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: getVerticalSize(context, ),
              // ),
            ]),
      ),
    );
  }

  Expanded dashboardWidget(BuildContext context,
      {String? image, String? text, Color? color, Function()? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getSize(context, 20)))),
        child: Container(
          decoration: BoxDecoration(
              color: color ?? ColorConstant.red100,
              borderRadius: BorderRadius.circular(getSize(context, 20))),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getSize(context, 20)),
                            topRight: Radius.circular(getSize(context, 20)),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(context, 15),
                  )
                ],
              ),
              Padding(
                padding: getPadding(context, top: 10, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AspectRatio(
                          aspectRatio: 2.5,
                          child: Image.asset(
                            image ?? ImageConstant.bookingLogo,
                            fit: BoxFit.fitHeight,
                          )),
                      Text(
                        text ?? "",
                        style: AppStyle.txtRobotoRomanRegular20(context),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
