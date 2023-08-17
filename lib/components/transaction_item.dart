import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({Key? key, required this.deleteTransaction, required this.tr}) : super(key: key);

  final Function(String) deleteTransaction;
  final Transaction tr;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(colors.length - 1);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            backgroundColor: _backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                  child: Text(
                    "R\$${widget.tr.value}",
                    style: const TextStyle(color: Colors.black),
                  )),
            )),
        title: Text(widget.tr.title,
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          DateFormat("dd/MM/yyyy").format(widget.tr.date),
          style: const TextStyle(fontFamily: 'Quicksand'),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
            onPressed: () => widget.deleteTransaction(widget.tr.id),
            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error,),
            label: Text(
              "Excluir",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error),
            ))
            : IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => widget.deleteTransaction(widget.tr.id),
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );;
  }
}
