import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/schedules_model.dart';
import 'package:bu_portal_app/pages/view_schedules/view_schedules_page_controller.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class ViewSelectedSchedule extends StatelessWidget {
  const ViewSelectedSchedule(
      {Key? key, required this.title, required this.academictermId})
      : super(key: key);
  final int academictermId;
  final String title;

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<ViewSchedulesPageManager>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      backgroundColor: colorCultured,
      body: ValueListenableBuilder<ScheduleList?>(
        valueListenable: stateManager.scheduleList,
        builder: (_, schedules, __) {
          var scd = schedules?.schedules;
          return scd != null
              ? ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: scd.length,
                  itemBuilder: (_, index) {
                    return scd[index].academicterm_id == academictermId
                        ? CardSchedule(schedule: scd[index])
                        : const SizedBox.shrink();
                  },
                )
              : const Center(
                  child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: LinearProgressIndicator(),
                ));
        },
      ),
    );
  }
}

class CardSchedule extends StatelessWidget {
  final Schedule schedule;
  CardSchedule({Key? key, required this.schedule}) : super(key: key);

  final List<Widget> timeDayWidgets = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < schedule.time.length; i++) {
      timeDayWidgets.add(
        Text(
          schedule.time[i] + ' | ' + schedule.day[i],
          style: const TextStyle(color: Colors.blueGrey),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.menu_book,
                color: Colors.blue,
              ),
              title: Text(
                schedule.course_title,
                style: const TextStyle(color: Colors.deepOrange),
              ),
              subtitle:
                  Text(schedule.course_code + ' | ' + schedule.employee_name),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: timeDayWidgets,
            ),
          ],
        ),
      ),
    );
  }
}
