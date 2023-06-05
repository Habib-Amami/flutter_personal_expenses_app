// ignore: file_names
import 'package:expensiceapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class transactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;
  const transactionCard(
      {super.key, required this.transaction, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(transaction.amount.toStringAsFixed(2)),
            ),
          ),
        ),
        title: Text(
          transaction.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
