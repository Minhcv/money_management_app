import 'package:flutter/material.dart';
import 'package:money_management_app/widgets/item_usage.dart';

import '../model/item.dart';
import '../widgets/dialog_box.dart';
import '../widgets/vote_bar.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final TextEditingController _controller = TextEditingController();

  List<Item> itemList = [
    Item('Làm bài tập Flutter', false),
    Item('Học tiếng Nhật', false),
  ];

  void checkBoxChange({required bool? value, required int index}) {
    setState(() {
      itemList[index].completed = !itemList[index].completed;
    });
  }

  void saveNewTask() {
    {
      setState(() {
        itemList.add(Item(
          _controller.text,
          false,
        ));
        _controller.clear();
        Navigator.of(context).pop();
      });
    }
  }

  void cancelNewTask() {
    {
      _controller.clear();
      Navigator.of(context).pop();
    }
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: cancelNewTask,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      itemList.removeAt(index);
    });
  }

  double _voteValue = 0;

  void _handleVoteChanged(double value) {
    setState(() {
      _voteValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Center(
            child: Text('Money Management'),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
        body: Center(
          // child: ListView.builder(
          //   itemCount: itemList.length,
          //   itemBuilder: (context, index) {
          //     return ItemUsage(
          //       taskName: itemList[index].title,
          //       isComplated: itemList[index].completed,
          //       onChange: (value) {
          //         checkBoxChange(index: index, value: value);
          //       },
          //       deleteFunction: (ctx) {
          //         deleteTask(index);
          //       },
          //     );
          //   },
          // ),
          child: VoteBar(
            value: _voteValue,
            onChanged: _handleVoteChanged,
          ),
        ));
  }
}
