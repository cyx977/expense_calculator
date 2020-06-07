import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (_, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  removeTransaction: removeTransaction);
            },
            itemCount: transactions.length,
          );
  }
}

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.removeTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function removeTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgcolor;
  @override
  void initState() {
    super.initState();
    const colors = [
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.yellow,
    ];
    _bgcolor = colors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgcolor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: FittedBox(
              child: Text(
                "\$${widget.transaction.amount}",
              ),
            ),
          ),
        ),
        title: Text(
          "${widget.transaction.title}",
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          "${DateFormat.yMMMd().format(widget.transaction.date)}",
        ),
        trailing: IconButton(
          onPressed: () {
            widget.removeTransaction(id: widget.transaction.id);
          },
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
