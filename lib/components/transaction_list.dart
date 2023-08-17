import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {super.key, required this.transactions, required this.deleteTransaction});

  final List<Transaction> transactions;
  final void Function(String) deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.05),
                Text("Nenhuma transação cadastrada",
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset("assets/images/waiting.png",
                      fit: BoxFit.cover),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                deleteTransaction: deleteTransaction,
                tr: tr,
              );
            },
          );
    // : ListView(
        //     children: transactions.map((tr) {
        //       return TransactionItem(
        //           key: ValueKey(tr.id),
        //           deleteTransaction: deleteTransaction,
        //           tr: tr);
        //     }).toList(),
        //   );
  }
}
