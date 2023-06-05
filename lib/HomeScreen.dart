// ignore: file_names
import 'dart:math';

import 'package:expensiceapp/models/transaction.dart';
import 'package:expensiceapp/widgets/NewTransaction.dart';
import 'package:expensiceapp/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  final List<Transaction> TransactionList = [];
  Random idGenrateur = Random();

  void addTransaction(String newTitle, double newAmount, DateTime chosenDate) {
    final newTransaction = Transaction(
        amount: newAmount,
        title: newTitle,
        id: idGenrateur.nextInt(10000),
        date: chosenDate);

    setState(() {
      TransactionList.add(newTransaction);
    });
  }

  void deleteTransaction(int id) {
    setState(() {
      TransactionList.removeWhere((transaction) => transaction.id == id);
    });
  }

  void startAddNewTransacation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          children: [
            Icon(Icons.monetization_on_rounded),
            SizedBox(
              width: 10,
            ),
            Text("Personal Expenses"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  startAddNewTransacation(context);
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: TransactionList.isEmpty == true
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Column(
                  children: [
                    Image.asset(
                      'assets/waiting.png',
                      scale: 3,
                    ),
                    const Text('No Transaction added')
                  ],
                )),
              )
            : transactionList(TransactionList, deleteTransaction),
      ),
    );
  }
}
