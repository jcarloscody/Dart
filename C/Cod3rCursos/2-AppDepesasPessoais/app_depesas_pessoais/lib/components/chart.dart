import 'package:app_depesas_pessoais/components/chart_bar.dart';
import 'package:app_depesas_pessoais/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranscation;

  const Chart({Key? key, required this.recentTranscation}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final data = DateTime.now().subtract(Duration(days: index));
      double valorT = 0;

      for (var i = 0; i < recentTranscation.length; i++) {
        bool day = recentTranscation[i].date.day == data.day;
        bool month = recentTranscation[i].date.month == data.month;
        bool year = recentTranscation[i].date.year == data.year;

        if (day && month && year) {
          valorT += recentTranscation[i].value;
        }
      }
      return {
        'day': DateFormat.E().format(data)[0],
        'value': valorT,
      };
    }).reversed.toList();
  }

  get valorTotalSemanal {
    return groupedTransactions.fold(0.0, (previousValue, element) {
      return (previousValue as double) + (element['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Row(
          children: groupedTransactions.map((element) {
            String day = element['day'] as String;
            double value = element['value'] as double;
            double percentual =
                (element['value'] as double) / valorTotalSemanal;
            return Flexible(
              child: ChartBar(day: day, value: value, percentual: percentual),
              fit: FlexFit.tight,
            );
          }).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
