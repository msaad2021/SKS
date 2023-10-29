import 'package:flutter/rendering.dart';

import '../../helper/app_export.dart';

class BookingsView extends GetView<BookingsController> {
  final BookingsController bookingsController = Get.put(BookingsController());
  BookingsView({super.key});
  List nav = ["All Bookings", "Pending", "Approved", "Rejected"];

  List statusColor = ['Pending', 'Approved', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(
        child: Container(
          padding: UIhelper.paddingHelper(context,
              top: 8, bottom: 8, right: 9, left: 9),
          decoration: BoxDecoration(
              color: ColorConstant.gray300,
              borderRadius: BorderRadius.circular(getSize(context, 4))),
          child: Text(
            nav[1],
            style: AppStyle.txtRobotoRomanRegular14Black900(context),
          ),
        ),
      ),
      Tab(text: 'Pending'),
      Tab(text: 'Completed'),
      Tab(text: 'Rejected'),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.gray50,
      appBar: const AppbarWidget(
        title: "Bookings",
      ),
      body: Obx(() {
        bookingsController.currentStep.value;
        return Padding(
          padding: UIhelper.paddingHelper(context,
              top: 25, bottom: 0, right: 19, left: 19),
          child: Stack(
            children: [
              Column(
                children: [
                  TextFormFieldWidget(
                    controller: bookingsController.search,
                    focusNode: bookingsController.focusNodes[0],
                    hint: "Search booking",
                  ),
                  SizedBox(
                    height: getVerticalSize(context, 40),
                    child: TabBar(
                      controller: bookingsController.controller,
                      tabs: bookingsController.myTabs,
                      physics: const BouncingScrollPhysics(),
                      labelStyle:
                          AppStyle.txtRobotoRomanRegular14Black900(context),
                      indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(getSize(context, 4)),
                        color: ColorConstant.blue700,
                      ),
                      indicatorPadding: EdgeInsets.zero,
                      indicatorWeight: 1,
                      labelColor: ColorConstant.whiteA700,
                      unselectedLabelColor: ColorConstant.black900,
                      labelPadding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height: getVerticalSize(context, 15),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: controller.controller,
                        children: controller.isLoading.value
                            ? [
                                Center(child: CircularProgressIndicator()),
                                Center(child: CircularProgressIndicator()),
                                Center(child: CircularProgressIndicator()),
                                Center(child: CircularProgressIndicator()),
                              ]
                            : [
                                bookingsList(context, controller.allBookings),
                                bookingsList(
                                    context, controller.pendingBookings),
                                bookingsList(
                                    context, controller.completedBookings),
                                bookingsList(
                                    context, controller.rejectedBookings),
                                // allBookings(context, 'Pending'),
                                // allBookings(context, 'Completed'),
                                // allBookings(context, 'Rejected'),
                              ]),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: UIhelper.paddingHelper(context,
                        top: 0, bottom: 20, right: 0, left: 0),
                    child: DefaultButtonWidget(
                      buttonText: "Add new booking",
                      onPressed: () {
                        Get.to(() => NewBookingView());
                      },
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }

  Widget bookingsList(BuildContext context, List<BookingsDatum>? bookingsList) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookingsList!.length,
            itemBuilder: (context, index) {
              return bookingsWidget(context, bookingsList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: getVerticalSize(context, 10),
              );
            },
          ),
          SizedBox(
            height: getVerticalSize(context, 100),
          )
        ],
      ),
    );
  }

  Widget bookingsWidget(BuildContext context, BookingsDatum booking) {
    // var ind = statusColor.indexWhere((element) => false);
    // print(ind);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(getSize(context, 11)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            //

            Get.to(() => BookingDetailsView(), arguments: booking);

            //
          },
          borderRadius: BorderRadius.circular(getSize(context, 11)),
          splashColor: ColorConstant.gray300,
          child: Container(
            padding: UIhelper.paddingHelper(context,
                top: 18, bottom: 18, right: 17, left: 17),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(booking.shipper ?? "",
                        style: AppStyle.txtRobotoRomanBold18(context)),
                    Row(
                      children: [
                        Container(
                          padding: UIhelper.paddingHelper(context,
                              top: 1, bottom: 1, right: 9, left: 9),
                          decoration: BoxDecoration(
                            color: booking.statusBgColor,
                            borderRadius:
                                BorderRadius.circular(getSize(context, 4)),
                          ),
                          child: Text(
                            booking.approvalStatus ?? "",
                            style: AppStyle.txtRobotoRomanBold15(context)
                                .copyWith(color: booking.statusTxtColor),
                          ),
                        ),
                        SizedBox(
                          width: getHorizontalSize(context, 20),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: getSize(context, 22),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "${booking.vessel} - ${booking.commodity}",
                  style: AppStyle.txtRobotoRomanRegular14Gray70099(context),
                ),
                SizedBox(
                  height: getVerticalSize(context, 10),
                ),
                RichText(
                    text: TextSpan(
                        text: 'POL:',
                        style:
                            AppStyle.txtRobotoRomanRegular16Black900(context),
                        children: <TextSpan>[
                      TextSpan(
                        text: booking.pol,
                        style: AppStyle.txtRobotoRomanBold16Black900(context),
                      )
                    ])),
                SizedBox(
                  height: getVerticalSize(context, 5),
                ),
                RichText(
                    text: TextSpan(
                        text: 'POD:',
                        style:
                            AppStyle.txtRobotoRomanRegular16Black900(context),
                        children: <TextSpan>[
                      TextSpan(
                        text: booking.pod,
                        style: AppStyle.txtRobotoRomanBold16Black900(context),
                      )
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
