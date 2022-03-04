import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/schedules_model.dart';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
import 'package:bu_portal_app/pages/view_schedules/view_schedules_page_controller.dart';
import 'package:bu_portal_app/pages/view_schedules/view_selected_schedule_page.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class ViewSchedulesPage extends StatefulWidget {
  const ViewSchedulesPage({Key? key}) : super(key: key);

  @override
  State<ViewSchedulesPage> createState() => _ViewSchedulesPageState();
}

class _ViewSchedulesPageState extends State<ViewSchedulesPage> {
  final stateManager = getIt<ViewSchedulesPageManager>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await stateManager.initialize(getIt<HomePageManager>().studentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleAppBar(),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: colorCultured,
      body: ValueListenableBuilder<YearTermList?>(
        valueListenable: stateManager.yearTermList,
        builder: (_, yearterm, __) {
          var yt = yearterm?.yearterms;
          return yt != null
              ? CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          elevation: 2.5,
                          color: colorCultured,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  /* Icon(Icons.schedule, size: 30.0),
                                  VerticalDivider(
                                    width: 4.0,
                                  ), */
                                  Text(
                                    'SCHEDULES',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 63, 63, 63),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        String title = yt[index].year_term_description;
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                title,
                              ),
                              trailing: const Icon(Icons.arrow_forward,
                                  color: Colors.blue),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ViewSelectedSchedule(
                                      academictermId: yt[index].academicterm_id,
                                      title: title,
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (index != yt.length) ...[
                              const Divider(height: 0, color: Colors.grey)
                            ]
                          ],
                        );
                      }, childCount: yt.length),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
