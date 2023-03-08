import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ItemUsage extends StatelessWidget {
  final String title;
  final int money;
  final DateTime dateCreated;
  final Function(BuildContext)? deleteFunction;

  const ItemUsage(
      {super.key,
      required this.title,
      required this.money,
      required this.dateCreated,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '$money K',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  )),
              Column(
                children: [
                  Text(
                    'Chi phí: $title',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(dateCreated),
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
