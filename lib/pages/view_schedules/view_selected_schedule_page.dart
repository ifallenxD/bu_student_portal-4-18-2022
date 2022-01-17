import 'package:auto_size_text/auto_size_text.dart';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/schedules_model.dart';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
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
      body: ValueListenableBuilder<ScheduleCardList?>(
        valueListenable: stateManager.schedCardList,
        builder: (_, schedules, __) {
          var scd = schedules?.scheduleCards;
          return scd != null
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
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
  final ScheduleCard schedule;
  CardSchedule({Key? key, required this.schedule}) : super(key: key);

  final List<Widget> dayWidgets = [];
  final List<Widget> timeWidgets = [];
  final List<Widget> roomWidgets = [];

  var lastDay = '';

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < schedule.schedules.length; i++) {
      if (lastDay == schedule.schedules[i].day) {
        dayWidgets.add(
          const Text(
            '',
            style: TextStyle(color: Colors.black),
          ),
        );
        timeWidgets.add(
          Text(
            schedule.schedules[i].time2,
            style: const TextStyle(color: Colors.blueGrey),
          ),
        );
        roomWidgets.add(
          AutoSizeText(
            schedule.schedules[i].room_code,
            style: const TextStyle(color: Colors.blueGrey),
            maxLines: 1,
          ),
        );
      } else {
        dayWidgets.add(
          Text(
            schedule.schedules[i].day,
            style: const TextStyle(color: Colors.blueGrey),
          ),
        );
        timeWidgets.add(
          Text(
            schedule.schedules[i].time2,
            style: const TextStyle(color: Colors.blueGrey),
          ),
        );
        roomWidgets.add(
          AutoSizeText.rich(
            TextSpan(
              text: schedule.schedules[i].room_code,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            maxLines: 1,
            minFontSize: 1,
          ),
        );
      }
      lastDay = schedule.schedules[i].day;
      if (i + 1 != schedule.schedules.length &&
          lastDay != schedule.schedules[i + 1].day) {
        dayWidgets.add(const SizedBox(height: 6));
        roomWidgets.add(const SizedBox(height: 6));
        timeWidgets.add(const SizedBox(height: 6));
      }
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
                schedule.schedules[0].course_title,
                style: const TextStyle(color: Colors.deepOrange),
              ),
              subtitle: Text(schedule.schedules[0].course_code +
                  ' | ' +
                  schedule.schedules[0].employee.capitalize()),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dayWidgets,
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: roomWidgets,
                    ),
                  ),
                  const VerticalDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: timeWidgets,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
