import '../../helper/app_export.dart';

class BookingDetailsView extends StatelessWidget {
  BookingDetailsView({super.key});

  BookingDetailsController controller = Get.put(BookingDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(title: "Booking Details"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: UIhelper.paddingHelper(context,
              top: 25, bottom: 25, right: 19, left: 19),
          child: Column(
            children: [
              Container(
                padding: UIhelper.paddingHelper(context,
                    top: 25, bottom: 19, right: 19, left: 19),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(getSize(context, 20))),
                child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipping Details",
                        style: AppStyle.txtRobotoRomanBold20Black900cc(context),
                      ),
                      SizedBox(
                        height: getVerticalSize(context, 17),
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.shippingDetails.length,
                        itemBuilder: (context, index) {
                          if (controller.shippingDetails[index] ==
                              'Special Instructions') {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.shippingDetails[index],
                                  style: AppStyle.txtRobotoRomanBold16Black900(
                                      context),
                                ),
                                SizedBox(
                                  height: getVerticalSize(context, 15),
                                ),
                                Text(
                                  controller.shippingDesc[index],
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppStyle.txtRobotoRomanRegular16Black900(
                                          context),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.shippingDetails[index],
                                  style:
                                      AppStyle.txtRobotoRomanRegular16Black900(
                                          context),
                                ),
                                Text(
                                  // shippingDetails[index],
                                  // controller.booking.pol ?? "",
                                  controller.shippingDesc[index],
                                  style: AppStyle.txtRobotoRomanBold16Black900(
                                          context)
                                      .copyWith(
                                          color: controller
                                                      .shippingDetails[index] ==
                                                  "Status"
                                              ? controller.statusTextColor
                                              : null),
                                ),
                              ],
                            );
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return DividerWidget(
                            padding: 2,
                          );
                        },
                      )
                    ]),
              ),
              SizedBox(
                height: getVerticalSize(context, 20),
              ),
              Container(
                padding: UIhelper.paddingHelper(context,
                    top: 25, bottom: 19, right: 19, left: 19),
                decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.circular(getSize(context, 20))),
                child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Company Details",
                        style: AppStyle.txtRobotoRomanBold20Black900cc(context),
                      ),
                      SizedBox(
                        height: getVerticalSize(context, 17),
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.companyDetails.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.companyDetails[index],
                                style: AppStyle.txtRobotoRomanRegular16Black900(
                                    context),
                              ),
                              Text(
                                controller.companyDesc[index],
                                style: AppStyle.txtRobotoRomanBold16Black900(
                                    context),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return DividerWidget(
                            padding: 2,
                          );
                        },
                      ),
                    ]),
              ),
              SizedBox(
                height: getVerticalSize(context, 50),
              ),
              DefaultButtonWidget(buttonText: "Change Status", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
