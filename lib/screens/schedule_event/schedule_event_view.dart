import '../../helper/app_export.dart';
import 'package:intl/intl.dart';

class ScheduleEventView extends StatelessWidget {
  ScheduleEventView({super.key});
  final TextEditingController eventTitle = TextEditingController();
  final TextEditingController eventDate = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

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

  String name = "Sania Adeel";
  String department = "Sales";
  String imgUrl = "";

  var currentStep = 0.obs;

  @override
  void onInit() {
    for (var node in focusNodes) {
      node.addListener(() {});
    }
    // TODO: implement onInit
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    print("inselect date");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      // setState(() {
      selectedDate = picked;
      eventDate.text = DateFormat.yMMMMEEEEd().format(selectedDate);
      // print(
      //     "${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}");
      print(selectedDate.toString());
      // });
    }
  }

  String selectedTime = "";

  Future<void> displayTimeDialog(bool isStartTime, BuildContext context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      selectedTime = time.format(context);
      // DateTime converTime = DateFormat.jm().parse(selectedTime);
      // selectedTime = DateFormat("HH:mm").format(converTime);
      isStartTime ? startTime.text = selectedTime : endTime.text = selectedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppbarWidget(title: "Schedule an event"),
      body: Padding(
        padding: UIhelper.paddingHelper(context,
            top: 22, bottom: 10, right: 19, left: 19),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormFieldWidget(
                hint: "Event Title",
                controller: eventTitle,
                focusNode: focusNodes[0],
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: TextFormFieldWidget(
                  controller: eventDate,
                  focusNode: focusNodes[1],
                  // padding: 15,
                  enabled: false,
                  hint: "Event Date",
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    size: getSize(context, 18),
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () => displayTimeDialog(true, context),
                        child: TextFormFieldWidget(
                          controller: startTime,
                          focusNode: focusNodes[2],
                          enabled: false,
                          hint: "Start Time",
                          icon: Icon(
                            Icons.more_time_outlined,
                            size: getSize(context, 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(context, 16),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () => displayTimeDialog(false, context),
                        child: TextFormFieldWidget(
                          controller: endTime,
                          focusNode: focusNodes[3],
                          enabled: false,
                          hint: "End Time",
                          icon: Icon(
                            Icons.more_time_outlined,
                            size: getSize(context, 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(context, 19),
              ),
              Text(
                "Participants",
                style: AppStyle.txtRobotoRomanBold18(context),
              ),
              SizedBox(
                height: getVerticalSize(context, 19),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const DividerWidget();
                        },
                        itemBuilder: (context, participant) {
                          return Row(
                            children: [
                              PrticipantListTile(
                                  imgUrl: imgUrl,
                                  name: name,
                                  department: department),
                            ],
                          );
                        },
                      ),
                      // DividerWidget(),
                      InkWell(
                        radius: getSize(context, 5),
                        onTap: () {
                          Get.to(() => AddParticipantView());
                        },
                        child: Padding(
                          padding: UIhelper.paddingHelper(context,
                              top: 5, bottom: 5, right: 5, left: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: getSize(context, 14),
                                backgroundColor:
                                    ColorConstant.black900.withOpacity(.7),
                                child: FittedBox(
                                    child: Icon(
                                  Icons.add,
                                  color: ColorConstant.whiteA700,
                                )),
                              ),
                              SizedBox(
                                width: getHorizontalSize(context, 11),
                              ),
                              Text(
                                "Add Participant",
                                style: AppStyle.txtRobotoRomanMedium18Black900(
                                    context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
