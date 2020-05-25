import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maxWorkshop/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:maxWorkshop/widgets/chartbar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({this.recentTransactions});
  double get totalSpending {
    return recentTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
    // double total = 0;
    // recentTransactions.forEach((element) {
    //   total += element.amount;
    // });
    // return total;
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal: totalSpending == 0
                    ? 0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
