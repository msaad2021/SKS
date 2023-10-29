// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../helper/app_export.dart';

class LeaveView extends StatelessWidget {
  LeaveView({super.key});

  double progressValue = 20;

  final LeaveController _controller = Get.put(LeaveController());

  TextEditingController leaveType = TextEditingController();

  List<FocusNode> focusNodes = [
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.gray50,
        appBar: AppbarWidget(title: "Apply Leave"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 414 / 191,
                child: Container(
                  padding: UIhelper.paddingHelper(context,
                      top: 27, bottom: 20, right: 23, left: 23),
                  color: ColorConstant.whiteA700,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      annotations: [
                                        GaugeAnnotation(
                                            positionFactor: 0.0,
                                            angle: 270,
                                            widget: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${_controller.anualRemain.toStringAsFixed(0)} / ${_controller.anualTotal.toStringAsFixed(0)}',
                                                  style: AppStyle
                                                      .txtRobotoRomanMedium16Black900(
                                                          context),
                                                ),
                                                Text(
                                                  "Remaining",
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12Gray90090(
                                                          context),
                                                )
                                              ],
                                            )),
                                      ],
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: _controller.anualRemain,
                                          cornerStyle:
                                              (_controller.anualRemain ==
                                                      _controller.anualTotal)
                                                  ? CornerStyle.bothFlat
                                                  : CornerStyle.bothCurve,
                                          width: 0.15,
                                          color: ColorConstant.lightBlue500,
                                          sizeUnit: GaugeSizeUnit.factor,
                                        )
                                      ],
                                      startAngle: 90,
                                      endAngle: 90,
                                      minimum: 0,
                                      maximum: _controller.anualTotal,
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.15,
                                        color: ColorConstant.gray50,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 8),
                          ),
                          Text(
                            "Annual",
                            style: AppStyle.txtRobotoRomanMedium18Black900(
                                context),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      annotations: [
                                        GaugeAnnotation(
                                            positionFactor: 0.0,
                                            angle: 270,
                                            widget: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${_controller.casualRemain.toStringAsFixed(0)} / ${_controller.casualTotal.toStringAsFixed(0)}',
                                                  style: AppStyle
                                                      .txtRobotoRomanMedium16Black900(
                                                          context),
                                                ),
                                                Text(
                                                  "Remaining",
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12Gray90090(
                                                          context),
                                                )
                                              ],
                                            )),
                                      ],
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: _controller.casualRemain,
                                          cornerStyle:
                                              (_controller.casualRemain ==
                                                      _controller.casualTotal)
                                                  ? CornerStyle.bothFlat
                                                  : CornerStyle.bothCurve,
                                          width: 0.15,
                                          color: ColorConstant.lightBlue500,
                                          sizeUnit: GaugeSizeUnit.factor,
                                        )
                                      ],
                                      startAngle: 90,
                                      endAngle: 90,
                                      minimum: 0,
                                      maximum: _controller.casualTotal,
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.15,
                                        color: ColorConstant.gray50,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 8),
                          ),
                          Text(
                            "Casual",
                            style: AppStyle.txtRobotoRomanMedium18Black900(
                                context),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      annotations: [
                                        GaugeAnnotation(
                                            positionFactor: 0.0,
                                            angle: 270,
                                            widget: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${_controller.sickRemain.toStringAsFixed(0)} / ${_controller.sickTotal.toStringAsFixed(0)}',
                                                  style: AppStyle
                                                      .txtRobotoRomanMedium16Black900(
                                                          context),
                                                ),
                                                Text(
                                                  "Sick",
                                                  style: AppStyle
                                                      .txtRobotoRomanRegular12Gray90090(
                                                          context),
                                                )
                                              ],
                                            )),
                                      ],
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: _controller.sickRemain,
                                          cornerStyle:
                                              (_controller.sickRemain ==
                                                      _controller.sickTotal)
                                                  ? CornerStyle.bothFlat
                                                  : CornerStyle.bothCurve,
                                          width: 0.15,
                                          color: ColorConstant.lightBlue500,
                                          sizeUnit: GaugeSizeUnit.factor,
                                        )
                                      ],
                                      startAngle: 90,
                                      endAngle: 90,
                                      minimum: 0,
                                      maximum: _controller.sickTotal,
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.15,
                                        color: ColorConstant.gray50,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(context, 8),
                          ),
                          Text(
                            "Annual",
                            style: AppStyle.txtRobotoRomanMedium18Black900(
                                context),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: UIhelper.paddingHelper(context,
                    top: 27, bottom: 47, right: 19, left: 19),
                child: Column(
                  children: [
                    BottomSheetTextFieldWidget(
                        controller: _controller.leaveType,
                        focusNode: focusNodes[0],
                        hintText: "Select leave type"),
                    BottomSheetTextFieldWidget(
                        controller: _controller.coveringPerson,
                        focusNode: focusNodes[0],
                        hintText: "Select Covering Person"),
                    TextFormFieldWidget(
                      hint: 'Reason',
                      controller: _controller.leaveReason,
                      focusNode: focusNodes[0],
                      manxLines: 5,
                    ),
                    TextFormFieldWidget(
                      hint: 'Reason',
                      controller: _controller.leaveReason,
                      focusNode: focusNodes[0],
                      manxLines: 5,
                    ),
                    TextFormFieldWidget(
                      hint: 'Reason',
                      controller: _controller.leaveReason,
                      focusNode: focusNodes[0],
                      manxLines: 5,
                    ),
                    DefaultButtonWidget(
                        buttonText: 'Apply leave',
                        onPressed: () {
                          _controller.onSubmit();
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
