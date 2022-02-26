import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:transport_belarus/bloc/authentication_bloc.dart';
import 'package:transport_belarus/model/authentication_model.dart';
import 'package:transport_belarus/model/bottom_sheet_model.dart';
import 'package:transport_belarus/screens/main_screen/main_screen.dart';
import 'package:transport_belarus/screens/start_screen/start_screen.dart';
import 'package:transport_belarus/services/translation.dart';

import 'bloc/bottom_sheet_bloc.dart';
import 'bloc/main_screen_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<MainScreenBloc>(
    MainScreenBloc(true),
  );
  GetIt.instance.registerSingleton<BottomSheetBloc>(
    BottomSheetBloc(
      BottomSheetState(
        regions: [],
      ),
    ),
  );
  GetIt.instance.registerSingleton<AuthenticationBloc>(
    AuthenticationBloc(
      AuthenticationBlocState(
        message: '',
        isLogin: false,
      ),
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authBloc = GetIt.I.get<AuthenticationBloc>();

  @override
  void initState() {
    authBloc.checkSignIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(true),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            AuthenticationBlocState(
              message: '',
              isLogin: false,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: authBloc.state.isLogin
            ? MainScreen(
                titleText: LocalizationKeys.findPeople,
                streamName: LocalizationKeys.people,
              )
            : StartWidget(),
      ),
    );
  }
}
