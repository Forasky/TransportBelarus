import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final maxWidthController = TextEditingController();
  final maxHeightController = TextEditingController();
  final qualityController = TextEditingController();
  final defaultUserImage = 'assets/images/user.png';
  final ImagePicker _picker = ImagePicker();
  late final XFile? image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                ),
                child: CircleAvatar(
                  radius: 80,
                  child: Image.asset(
                    defaultUserImage,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  image = await _picker.pickImage(source: ImageSource.gallery);
                },
                child: Text(
                  'Change image',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add optional parameters'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: maxWidthController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: "Enter maxWidth if desired"),
              ),
              TextField(
                controller: maxHeightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: "Enter maxHeight if desired"),
              ),
              TextField(
                controller: qualityController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: "Enter quality if desired"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('PICK'),
              onPressed: () {
                double? width = maxWidthController.text.isNotEmpty
                    ? double.parse(maxWidthController.text)
                    : null;
                double? height = maxHeightController.text.isNotEmpty
                    ? double.parse(maxHeightController.text)
                    : null;
                int? quality = qualityController.text.isNotEmpty
                    ? int.parse(qualityController.text)
                    : null;
                onPick(width, height, quality);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);
