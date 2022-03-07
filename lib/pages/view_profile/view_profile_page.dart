import 'package:auto_size_text/auto_size_text.dart';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/student_profile_model.dart';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
import 'package:bu_portal_app/pages/view_profile/view_profile_page_controller.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  final stateManager = getIt<ViewProfilePageManager>();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await stateManager.initialize(getIt<HomePageManager>().studentId);
  }

  @override
  void dispose() {
    stateManager.studentProfile = ValueNotifier<StudentProfile?>(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleAppBar(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Material(
        color: colorCultured,
        child: ValueListenableBuilder<StudentProfile?>(
          valueListenable: stateManager.studentProfile,
          builder: (_, profile, __) {
            return (profile != null)
                ? const SingleChildScrollView(child: ProfileBuilder())
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ProfileBuilder extends StatelessWidget {
  const ProfileBuilder({Key? key}) : super(key: key);

  TextStyle get _subtitle => TextStyle(color: secondaryColor, fontSize: 10.0);
  TextStyle get _title => TextStyle(
      color: colorSpaceGray, fontSize: 14.0, fontWeight: FontWeight.bold);
  TextStyle get _header => TextStyle(
      color: primaryColor, fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final sm = getIt<ViewProfilePageManager>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 2.5,
            color: colorCultured,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    /* Icon(Icons.person, size: 33.0),
                    VerticalDivider(
                      width: 4.0,
                    ), */
                    Text(
                      'PROFILE',
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
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: RichText(
            text: TextSpan(
              style: _header,
              children: const [
                TextSpan(text: 'STUDENT '),
                TextSpan(text: 'INFO'),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.fullname, style: _title, maxLines: 2),
                subtitle: Text('NAME', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(sm.studentNumber, style: _title),
                subtitle: Text('STUDENT NO.', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.dateOfBirth, style: _title, maxLines: 2),
                subtitle: Text('DATE OF BIRTH', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.gender, style: _title, maxLines: 1),
                subtitle: Text('GENDER', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title:
                    AutoSizeText(sm.placeOfBirth, style: _title, maxLines: 2),
                subtitle: Text('PLACE OF BIRTH', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.nationality, style: _title, maxLines: 1),
                subtitle: Text('NATIONALITY', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0),
          child: RichText(
            text: TextSpan(
              style: _header,
              children: const [
                TextSpan(text: 'CONTACT '),
                TextSpan(text: 'INFO'),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.mobileNo, style: _title, maxLines: 1),
                subtitle: Text('MOBILE NO.', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.altEmail, style: _title, maxLines: 2),
                subtitle: Text('PERSONAL EMAIL', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0),
          child: RichText(
            text: TextSpan(
              style: _header,
              children: const [
                TextSpan(text: 'ADDRESS '),
                TextSpan(text: 'INFO'),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.address, style: _title, maxLines: 2),
                subtitle: Text('ADDRESS', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title:
                    AutoSizeText(sm.cityProvince, style: _title, maxLines: 2),
                subtitle: Text('CITY/PROVINCE', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.zipcode, style: _title, maxLines: 2),
                subtitle: Text('ZIPCODE', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0),
          child: RichText(
            text: TextSpan(
              style: _header,
              children: const [
                TextSpan(text: 'PARENTS '),
                TextSpan(text: 'INFO'),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.fatherName, style: _title, maxLines: 2),
                subtitle: Text('FATHER\'S NAME', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title:
                    AutoSizeText(sm.fatherMobileNo, style: _title, maxLines: 2),
                subtitle: Text('FATHER\'S MOBILE NO.', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.fatherOccupation,
                    style: _title, maxLines: 2),
                subtitle: Text('FATHER\'S OCCUPATION', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.motherName, style: _title, maxLines: 2),
                subtitle: Text('MOTHER\'S NAME', style: _subtitle),
                dense: true,
              ),
            ),
            Expanded(
              child: ListTile(
                title:
                    AutoSizeText(sm.motherMobileNo, style: _title, maxLines: 2),
                subtitle: Text('MOTHER\'S MOBILE NO.', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
        const Divider(height: 0),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: AutoSizeText(sm.motherOccupation,
                    style: _title, maxLines: 2),
                subtitle: Text('MOTHER\'S OCCUPATION', style: _subtitle),
                dense: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
