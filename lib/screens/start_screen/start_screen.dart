// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_belarus/screens/main_screen/main_screen.dart';
import 'package:transport_belarus/screens/signup_screen.dart/signup_screen.dart';
import 'package:transport_belarus/services/fonts.dart';
import 'package:transport_belarus/services/translation.dart';

class StartWidget extends StatefulWidget {
  StartWidget({Key? key}) : super(key: key);
  final numberController = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  static const logo = 'assets/images/logo.png';
  static const title = 'PeCaBel';

  @override
  void dispose() {
    widget.numberController.dispose();
    widget.passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Image.asset(
                    logo,
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  title,
                  style: Font.joseStyle24,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: Font.joseStyle18,
                      children: [
                        TextSpan(
                          text: LocalizationKeys.explainText,
                        ),
                        TextSpan(
                          text: '\n' + LocalizationKeys.ifHaveNotAccount,
                        ),
                        TextSpan(
                          text: LocalizationKeys.register,
                          style: GoogleFonts.jost(
                            fontSize: 20,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpWidget(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: widget.numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        FontAwesomeIcons.phone,
                      ),
                      hintText: LocalizationKeys.enterNubmer,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: widget.passwordControler,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: const Icon(
                        FontAwesomeIcons.lock,
                      ),
                      hintText: LocalizationKeys.wrPassword,
                    ),
                  ),
                ),
                ElevatedButton(
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
                    LocalizationKeys.login,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LocalizationKeys.forgotPassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
