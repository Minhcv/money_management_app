import 'package:flutter/material.dart';
import 'package:money_management_app/screens/home_screen_page.dart';

import 'widgets/poll_option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: PollScreen(),
    );
  }
}

class PollItem {
  String name;
  bool selected;

  PollItem(this.name, this.selected);
}

class PollScreen extends StatefulWidget {
  @override
  _PollScreenState createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  List<PollItem> pollItems = [
    PollItem("Option 1", false),
    PollItem("Option 2", false),
    PollItem("Option 3", false),
    PollItem("Option 4", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poll"),
      ),
      body: ListView.builder(
        itemCount: pollItems.length,
        itemBuilder: (BuildContext context, int index) {
          return PollOption(
            optionText: 'Option A',
            percent: 40,
            backgroundColor: Colors.grey[300]!,
            foregroundColor: Colors.blue,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Do something with the selected items
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
