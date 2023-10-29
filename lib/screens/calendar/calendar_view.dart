import '../../helper/app_export.dart';
import 'package:intl/intl.dart';

class CalendarView extends GetView<CalendarController> {
  final CalendarController _controller = Get.put(CalendarController());
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 12, 0),
          color: Colors.orange,
          description: "Hellllllo"),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.pink,
          description: "Hellllllo"),
      CleanCalendarEvent('Event D',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.orange,
          description: "Hellllllo"),
      CleanCalendarEvent('Event E',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.pink,
          description: "Hellllllo"),
      CleanCalendarEvent('Event F',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.orange,
          description: "Hellllllo"),
      CleanCalendarEvent('Event G',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.pink),
      CleanCalendarEvent('Event H',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event F',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.orange,
          description: "Hellllllo"),
      CleanCalendarEvent('Event G',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.pink),
      CleanCalendarEvent('Event H',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 17, 0),
          color: Colors.orange),
    ],
  };

  // @override
  // void initState() {
  //   super.initState();
  //   // Force selection of today on first load, so that the list of today's events gets shown.
  //   _handleNewDate(DateTime(
  //       DateTime.now().year, DateTime.now().month, DateTime.now().day));
  // }

  bool isExpand = false;
  List<CleanCalendarEvent> todayEvent = [];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppbarWidget(
            title: 'Calendar',
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Calendar(
                        startOnMonday: true,
                        events: _events,
                        weekDays: const [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun'
                        ],
                        eventDoneColor: ColorConstant.lightGreen500,
                        selectedColor: ColorConstant.lightGreen500,
                        todayColor: ColorConstant.lightBlue800,
                        eventColor: ColorConstant.lightBlue800,
                        locale: 'en_US',
                        hideTodayIcon: true,
                        isExpanded: controller.isExpanded.value,
                        isExpandable: true,
                        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                        dayOfWeekStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 11),
                        onExpandStateChanged: (expand) {
                          print("onExpandStateChanged ----------");
                          isExpand = expand;
                        },
                        eventListBuilder: eventsWidget,
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: UIhelper.paddingHelper(context,
                          top: 0, bottom: 20, right: 19, left: 19),
                      child: DefaultButtonWidget(
                        buttonText: "Schedule an event",
                        onPressed: () {
                          Get.to(() => ScheduleEventView());
                        },
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  eventsWidget(context, events) {
    todayEvent = events;
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final CleanCalendarEvent event = todayEvent[index];
                var startTime = DateFormat.jm().format(event.startTime);
                var day = DateFormat.EEEE().format(event.startTime);
                var date = DateFormat.d().format(event.startTime);
                return Container(
                  padding: UIhelper.paddingHelper(context,
                      top: 0, bottom: 0, right: 22, left: 22),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => EventView());
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                              flex: 1, child: Center(child: Text(startTime))),
                          Flexible(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: (index.isEven
                                        ? ColorConstant.blue801
                                        : ColorConstant.amber400)
                                    .withOpacity(.15),
                                borderRadius: BorderRadius.circular(
                                  getSize(context, 4),
                                ),
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getHorizontalSize(context, 5),
                                        decoration: BoxDecoration(
                                          color: (index.isEven
                                              ? ColorConstant.blue801
                                              : ColorConstant.amber400),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getSize(context, 4)),
                                            bottomLeft: Radius.circular(
                                                getSize(context, 4)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: UIhelper.paddingHelper(
                                              context,
                                              top: 15,
                                              bottom: 15,
                                              right: 20,
                                              left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    event.summary,
                                                    style: AppStyle
                                                        .txtRobotoRomanMedium15Gray900(
                                                            context),
                                                  ),
                                                  Text(
                                                    "$day - $startTime PKT",
                                                    style: AppStyle
                                                            .txtRobotoRomanMedium15Gray900(
                                                                context)
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .gray900
                                                                .withOpacity(
                                                                    0.6)),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: getSize(context, 13),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        ]),
                  ),
                );
              },
              itemCount: todayEvent.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: getVerticalSize(context, 9),
                );
              },
            ),
            SizedBox(
              height: getVerticalSize(context, 100),
            )
          ],
        ),
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
