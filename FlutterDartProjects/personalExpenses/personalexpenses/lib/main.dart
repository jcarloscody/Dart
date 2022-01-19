// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personalexpenses/widgets/chart.dart';
import 'package:personalexpenses/widgets/new_transaction.dart';
import 'package:personalexpenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 50,
                    fontWeight: FontWeight.normal))),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late String titleInput;

  bool _showChart = false;

  final List<Transaction> _userTransactions = [
    /*Transaction(
      id: 0,
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 1,
      title: 'Weekly Groceries',
      amount: 16.56,
      date: DateTime.now(),
    )*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((elem) {
      return elem.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  int cont = 0;

  String _invalid = '';

  void _invalidArgs(String args) {
    setState(() {
      this._invalid = args;
    });
  }

  void _addNewTransaction(Transaction t) {
    cont++;
    t.id = cont;
    print("VALOR :::: $cont");
    setState(() {
      _userTransactions.add(t);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return GestureDetector(
            //por padrão não é necessário em muitos dispositivos, mas no future não serrá necessairo o gesture
            child: NewTransaction(
                addNewTransaction: _addNewTransaction,
                invalidArgs: _invalidArgs),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransactions(int id) {
    setState(() {
      print("valor $id");
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final isLandScape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        ),
      ],
    );

    final cupertinoNavigationBar = CupertinoNavigationBar(
      middle: Text("Personal Expenses"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Icon(
              CupertinoIcons.add,
            ),
            onTap: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
    );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              (Platform.isIOS
                  ? appBar.preferredSize.height
                  : cupertinoNavigationBar.preferredSize.height) -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        transactions: _userTransactions,
        deleteTransactions: _deleteTransactions,
      ),
    );

    final txErro = Text(
      _invalid,
      style: TextStyle(
          backgroundColor: Colors.black,
          color: Colors.red,
          fontWeight: FontWeight.bold),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            txErro,
            if (!isLandScape)
              Container(
                height: (mediaQuery.size.height -
                        (Platform.isIOS
                            ? appBar.preferredSize.height
                            : cupertinoNavigationBar.preferredSize.height) -
                        mediaQuery.padding.top) *
                    0.25,
                child: Chart(recentTransactions: _recentTransactions),
              ),
            if (!isLandScape) txListWidget,
            if (isLandScape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              (Platform.isIOS
                                  ? appBar.preferredSize.height
                                  : cupertinoNavigationBar
                                      .preferredSize.height) -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(recentTransactions: _recentTransactions),
                    )
                  : txListWidget
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: cupertinoNavigationBar,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddNewTransaction(context),
                    child: Icon(Icons.add),
                  ),
          );
  }
}
