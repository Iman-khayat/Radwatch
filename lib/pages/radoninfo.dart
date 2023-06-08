import 'package:flutter/material.dart';

void main() {
  runApp(Radoninfo());
}

class Radoninfo extends StatefulWidget {
  const Radoninfo();

  @override
  _RadoninfoState createState() => _RadoninfoState();
}

class _RadoninfoState extends State<Radoninfo> {
  List<Map> _info = [
    {'id': '100', 'Radon': '10', 'Temprature': '20', 'Humidtiy': '20'},
    {'id': '200', 'Radon': '10', 'Temprature': '22', 'Humidtiy': '20'},
    {'id': '300', 'Radon': '10', 'Temprature': '21', 'Humidtiy': '20'}
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(255, 20, 44, 32),
          title: Text('DataTable'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Image.asset(
                "assets/images/logo.png",
              ),
              _createDataTable()
            ],
          ),
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      sortAscending: true,
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 234, 219, 175)),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Radon')),
      DataColumn(label: Text('Temprature')),
      DataColumn(label: Text('Humidtiy'))
    ];
  }

  List<DataRow> _createRows() {
    return _info
        .map((info) => DataRow(cells: [
              DataCell(Text('#' + info['id'].toString())),
              DataCell(Text(info['Radon'])),
              DataCell(Text(info['Temprature'])),
              DataCell(Text(info['Humidtiy']))
            ]))
        .toList();
  }
}
