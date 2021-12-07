import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transport_belarus/services/fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var count = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Icon(
                      Icons.map_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Артём Андреевич',
                    style: Font.joseStyle24,
                  ),
                  Text(
                    '+375445458845',
                    style: Font.joseStyle16,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View profile',
                      style: Font.joseStyle20,
                    ),
                  ),
                  const Spacer(),
                  ListTile(
                    onTap: () {},
                    leading: const FaIcon(
                      FontAwesomeIcons.car,
                    ),
                    title: Text(
                      'Check cars',
                      style: Font.joseStyle20,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const FaIcon(
                      FontAwesomeIcons.userAlt,
                    ),
                    title: Text(
                      'Check people',
                      style: Font.joseStyle20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Попутчики Беларусь v0.1',
                    style: Font.joseStyleGrey16,
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Найти попутчиков',
              style: Font.joseStyle24,
            ),
            backgroundColor: Colors.green,
          ),
          body: ListView.builder(
            itemCount: count,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ListItem();
            },
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => FruitDetail(
      //             fruitDataModel: Fruitdata[index],
      //           )));
      // },
      trailing: TextButton(
        onPressed: () {},
        child: const Icon(
          Icons.star_border_outlined,
        ),
      ),
      leading: const Icon(
        Icons.class_,
        size: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Пинск - Брест   ',
            style: Font.joseStyle16,
          ),
          Text(
            '6 декабря',
            style: Font.joseStyle16,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Артём',
            style: Font.joseStyleGrey16,
          ),
          Text(
            'Плата договорная',
            style: Font.joseStyleGrey16,
          ),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        30,
        10,
        0,
        30,
      ),
    );
  }
}
