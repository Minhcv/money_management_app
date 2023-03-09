import 'package:flutter/material.dart';
import 'package:money_management_app/widgets/item_usage.dart';
import 'package:money_management_app/widgets/column_chart.dart';
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
  late DateTime _dateCreate = DateTime.now();

  List<Item> itemList = [];

  int sumMoney = 0;

  List<int> sumMoneyOfDayOfWeek = [0, 0, 0, 0, 0, 0, 0];

  void saveNewTask() {
    {
      setState(() {
        if (_title.text.isNotEmpty && _money.text.isNotEmpty) {
          itemList.add(Item(_title.text, int.parse(_money.text), _dateCreate,
              _dateCreate.weekday));
          _title.clear();
          _money.clear();
          sumMoney = 0;
          sumMoneyOfDayOfWeek = [0, 0, 0, 0, 0, 0, 0];
          for (var item in itemList) {
            sumMoney += item.money;
            switch (item.dayOfWeek) {
              case 1:
                sumMoneyOfDayOfWeek[1] += item.money;
                break;
              case 2:
                sumMoneyOfDayOfWeek[2] += item.money;
                break;
              case 3:
                sumMoneyOfDayOfWeek[3] += item.money;
                break;
              case 4:
                sumMoneyOfDayOfWeek[4] += item.money;
                break;
              case 5:
                sumMoneyOfDayOfWeek[5] += item.money;
                break;
              case 6:
                sumMoneyOfDayOfWeek[6] += item.money;
                break;
              case 7:
                sumMoneyOfDayOfWeek[0] += item.money;
                break;
            }
          }
        }
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
        showDatetimePicker: showDatetimePicker,
        selectedDate: _dateCreate,
      ),
    );
  }

  Future<void> showDatetimePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateCreate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != _dateCreate) {
      setState(() {
        _dateCreate = picked;
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      itemList.removeAt(index);
      sumMoney = 0;
      sumMoneyOfDayOfWeek = [0, 0, 0, 0, 0, 0, 0];
      for (var item in itemList) {
        sumMoney += item.money;
        switch (item.dayOfWeek) {
          case 1:
            sumMoneyOfDayOfWeek[1] += item.money;
            break;
          case 2:
            sumMoneyOfDayOfWeek[2] += item.money;
            break;
          case 3:
            sumMoneyOfDayOfWeek[3] += item.money;
            break;
          case 4:
            sumMoneyOfDayOfWeek[4] += item.money;
            break;
          case 5:
            sumMoneyOfDayOfWeek[5] += item.money;
            break;
          case 6:
            sumMoneyOfDayOfWeek[6] += item.money;
            break;
          case 7:
            sumMoneyOfDayOfWeek[0] += item.money;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: Column(
            children: [
              FloatingActionButton(
                onPressed: addNewTask,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: CustomScrollView(slivers: [
          // ignore: prefer_const_constructors
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 100.0,
              child: Center(
                child: Text('Quản lý tiền theo tuần',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 20,
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ColumnChart(
                  backgroundColor: Colors.grey[300]!,
                  foregroundColor: Colors.blue,
                  optionText: '$index',
                  money: sumMoneyOfDayOfWeek[index],
                  sum: sumMoney,
                );
              },
              childCount: 7,
            ),
          ),
          // ignore: prefer_const_constructors
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 100.0,
              child: Center(
                child: Text('Lịch sử tiêu sài',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 20,
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemUsage(
                  title: itemList[index].title,
                  money: itemList[index].money,
                  day: itemList[index].dayOfWeek,
                  dateCreated: itemList[index].dateCreated,
                  deleteFunction: (ctx) {
                    deleteTask(index);
                  },
                );
              },
              childCount: itemList.length,
            ),
          )
        ]));
  }
}
