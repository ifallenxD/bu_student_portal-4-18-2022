import 'package:auto_size_text/auto_size_text.dart';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/student_model.dart';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
import 'package:bu_portal_app/pages/home/widgets/action_button.dart';
import 'package:bu_portal_app/pages/view_grades/view_grades_page.dart';
import 'package:bu_portal_app/pages/view_profile/view_profile_page.dart';
import 'package:bu_portal_app/pages/view_schedules/view_schedules_page.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Student student;
  const HomePage({Key? key, required this.student}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final stateManager = getIt<HomePageManager>();

  @override
  void initState() {
    stateManager.initialize(widget.student);
    super.initState();
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: colorCultured,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText.rich(
                        TextSpan(
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            const TextSpan(text: 'Welcome, '),
                            TextSpan(
                              text: stateManager.studFirstname + '!',
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        minFontSize: 1,
                      ),
                    ),
                    const VerticalDivider(),
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          onTap: () => stateManager.logout(context),
                          child: Tooltip(
                            message: 'Logout',
                            child: SizedBox(
                              width: 36.0,
                              height: 36.0,
                              child: Icon(
                                Icons.logout,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorCultured,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: shadowColor,
                        offset: const Offset(0, -2),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Actions',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              stateManager.dateToday,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 16, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BUActionButton(
                                  text: 'View Profile',
                                  boxDecorationColor: colorCultured,
                                  boxDecorationShadowColor: shadowColor,
                                  icon: Icons.person,
                                  iconColor: primaryColor,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ViewProfilePage(),
                                      ),
                                    );
                                  },
                                ),
                                BUActionButton(
                                  text: 'View Grades',
                                  boxDecorationColor: colorCultured,
                                  boxDecorationShadowColor: shadowColor,
                                  icon: Icons.view_list,
                                  iconColor: primaryColor,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ViewGradesPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 16, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BUActionButton(
                                  text: 'View Schedule',
                                  boxDecorationColor: colorCultured,
                                  boxDecorationShadowColor: shadowColor,
                                  icon: Icons.schedule,
                                  iconColor: primaryColor,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ViewSchedulesPage(),
                                      ),
                                    );
                                  },
                                ),
                                BUActionButton(
                                  text: 'View Fees',
                                  boxDecorationColor: colorCultured,
                                  boxDecorationShadowColor: shadowColor,
                                  icon: Icons.assessment,
                                  iconColor: primaryColor,
                                  onPressed: () {},
                                  disabled: true,
                                ),
                              ],
                            ),
                          ],
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
