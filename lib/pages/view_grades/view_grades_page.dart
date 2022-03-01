import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/grades_model.dart';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
import 'package:bu_portal_app/pages/view_grades/view_grades_page_controller.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class ViewGradesPage extends StatefulWidget {
  const ViewGradesPage({Key? key}) : super(key: key);

  @override
  State<ViewGradesPage> createState() => _ViewGradesPageState();
}

class _ViewGradesPageState extends State<ViewGradesPage> {
  final stateManager = getIt<ViewGradesPageManager>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await stateManager.initGradesList(getIt<HomePageManager>().studentId);
  }

  @override
  Widget build(BuildContext context) {
    final sm = getIt<ViewGradesPageManager>();
    return Scaffold(
      appBar: AppBar(
        title: titleAppBar(),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: colorCultured,
      body: ValueListenableBuilder<AcademicTermList?>(
        valueListenable: sm.academicTermList,
        builder: (_, acadterm, __) {
          var at = acadterm?.academicterms;
          return at != null
              ? CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                at[index].school_year +
                                    ' ' +
                                    at[index].semester,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: at[index].grades.length,
                                itemBuilder: (BuildContext _, int j) {
                                  // grades
                                  var currentGrade = at[index].grades.grades[j];
                                  return at.isNotEmpty
                                      ? ListTile(
                                          leading: SizedBox(
                                            width: 50.0,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  currentGrade.course_code,
                                                  style: TextStyle(
                                                    color: colorSpaceGray,
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          title: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                currentGrade.course_title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${currentGrade.final_grade}',
                                                style: const TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const CircularProgressIndicator();
                                },
                              ),
                              if (index != at.length - 1)
                                const Divider(height: 0, thickness: 2.0)
                            ],
                          ),
                        );
                      }, childCount: at.length),
                    )
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
