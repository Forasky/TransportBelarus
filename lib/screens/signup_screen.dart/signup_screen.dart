// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transport_belarus/screens/main_screen/main_screen.dart';
import 'package:transport_belarus/services/fonts.dart';
import 'package:transport_belarus/services/translation.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            LocalizationKeys.labelRegistration,
            style: Font.joseStyle20,
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.userAlt,
                  ),
                  hintText: LocalizationKeys.enterFLname,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.phoneAlt,
                  ),
                  hintText: LocalizationKeys.enterNubmer,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.lock,
                  ),
                  hintText: LocalizationKeys.wrPassword,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.lock,
                  ),
                  hintText: LocalizationKeys.repeatPassword,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      titleText: LocalizationKeys.findPeople,
                      streamName: LocalizationKeys.people,
                    ),
                  ),
                ),
                child: Text(
                  LocalizationKeys.submit,
                  style: Font.joseStyle20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
