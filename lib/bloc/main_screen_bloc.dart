import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_belarus/model/main_screen_model.dart';

class MainScreenBloc extends Cubit<MainScreenBlocState> {
  MainScreenBloc(initialState)
      : super(
          MainScreenBlocState(
            isOn: true,
          ),
        );

  Stream<QuerySnapshot<Map<String, dynamic>>> streamBloc(String whatToFind) {
    final documentStream =
        FirebaseFirestore.instance.collection(whatToFind).snapshots();
    return documentStream;
  }
}
