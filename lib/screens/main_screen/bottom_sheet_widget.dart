import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:transport_belarus/bloc/main_screen_bloc.dart';
import 'package:transport_belarus/model/main_screen_bloc.dart';
import 'package:transport_belarus/services/fonts.dart';
import 'package:transport_belarus/services/translation.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

enum collection { people, cars }

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var _isRadioSelected = false;
  final mainBloc = GetIt.instance.get<MainScreenBloc>();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final paymentController = TextEditingController();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    dateController.dispose();
    nameController.dispose();
    phoneController.dispose();
    paymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenBlocState>(
      bloc: mainBloc,
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Text(
                LocalizationKeys.addRequest,
                style: Font.joseStyle24,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: fromController,
                      decoration: InputDecoration(
                        icon: Text(
                          LocalizationKeys.from,
                          style: Font.joseStyleGrey16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: toController,
                      decoration: InputDecoration(
                        icon: Text(
                          LocalizationKeys.to,
                          style: Font.joseStyleGrey16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: TextField(
                controller: dateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.calendarAlt,
                  ),
                  hintText: LocalizationKeys.chooseDate,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: TextField(
                controller: paymentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: const Icon(
                    FontAwesomeIcons.coins,
                  ),
                  hintText: LocalizationKeys.choosePayment,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: const Icon(
                          FontAwesomeIcons.userAlt,
                        ),
                        hintText: LocalizationKeys.enterName,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        icon: const Icon(
                          FontAwesomeIcons.phoneAlt,
                        ),
                        hintText: LocalizationKeys.enterNubmer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                10,
              ),
              child: Text(
                LocalizationKeys.iWantFind,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LabeledRadio(
                  label: LocalizationKeys.findPeople,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  value: true,
                  groupValue: _isRadioSelected,
                  onChanged: (bool newValue) {
                    setState(
                      () {
                        _isRadioSelected = newValue;
                      },
                    );
                  },
                ),
                LabeledRadio(
                  label: LocalizationKeys.findCars,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  value: false,
                  groupValue: _isRadioSelected,
                  onChanged: (bool newValue) {
                    setState(
                      () {
                        _isRadioSelected = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(
                      LocalizationKeys.addRequest,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      mainBloc.addRequest(
                        LocalizationKeys.people,
                        fromController.text,
                        phoneController.text,
                        paymentController.text,
                        toController.text,
                        DateFormat('d.m.y').parse(dateController.text),
                        nameController.text,
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Text(
                      LocalizationKeys.close,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, DateTime.now().month),
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month + 5),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(
        () {
          dateController.text = DateFormat('d.M.y').format(picked);
        },
      );
    }
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
