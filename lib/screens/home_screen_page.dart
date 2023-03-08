import 'package:flutter/material.dart';
import 'package:money_management_app/widgets/item_usage.dart';
import 'package:money_management_app/widgets/poll_option.dart';

import '../model/item.dart';
import '../widgets/dialog_box.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _money = TextEditingController();
  final DateTime _dateCreate = DateTime.now();

  List<Item> itemList = [
    Item('Làm bài tập Flutter', 3000, DateTime.now()),
    Item('Học tiếng Nhật', 4000, DateTime.now()),
  ];

  void saveNewTask() {
    {
      setState(() {
        itemList.add(Item(
          _title.text,
          int.parse(_money.text),
          DateTime.now(),
        ));
        _title.clear();
        _money.clear();
        Navigator.of(context).pop();
      });
    }
  }

  void cancelNewTask() {
    {
      _title.clear();
      _money.clear();
      Navigator.of(context).pop();
    }
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        title: _title,
        money: _money,
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
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: Center(
                child: Text('Tuần này'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PollOption(
                  backgroundColor: Colors.grey[300]!,
                  foregroundColor: Colors.blue,
                  optionText: 'Thứ $index',
                  percent: 40,
                );
              },
              childCount: 7,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: Center(
                child: Text('Lịch sử tiêu sài'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemUsage(
                  title: itemList[index].title,
                  money: itemList[index].money,
                  dateCreated: itemList[index].dateCreated,
                  deleteFunction: (ctx) {
                    deleteTask(index);
                  },
                );
              },
              childCount: itemList.length,
            ),
          ),
        ]));
  }
}
