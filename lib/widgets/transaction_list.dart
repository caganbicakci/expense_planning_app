import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 600,
        child: transactions.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'There is no expenses yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
