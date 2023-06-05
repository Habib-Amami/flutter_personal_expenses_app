// ignore_for_file: file_names

import 'package:expensiceapp/models/transaction.dart';
import 'package:expensiceapp/widgets/transactionCard.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class transactionList extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List<Transaction> TransactionList;
  final Function deleteTransaction;

  const transactionList(this.TransactionList, this.deleteTransaction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 10,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return transactionCard(
              transaction: TransactionList[index],
              deleteTransaction: deleteTransaction);
        },
        itemCount: TransactionList.length,
      ),
    );

    // Column(
    //     children: TransactionList.map((t) {
    //   return ;
    // }).toList());
  }
}
