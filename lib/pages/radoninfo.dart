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
    {'Radon': '10', 'Temp-inside': '20', 'Temp-outside': '20', 'Humidtiy-inside': '20', 'Humidtiy-outside': '20'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.amber[200],
          automaticallyImplyLeading: true,
          title: Text('DataTable'),
        ),
        body: Container(
          color: Color.fromARGB(255, 3, 37, 13),
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
      columnSpacing:double.minPositive,
      showCheckboxColumn: false,
      columns: _createColumns(),
      rows: _createRows(),
      dataRowColor:MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 234, 219, 175)) ,
      sortAscending: true,
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromARGB(255, 234, 219, 175)),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Radon')),
      DataColumn(label: Icon(Icons.thermostat)),
      DataColumn(label: Icon(Icons.thermostat_auto)),
      DataColumn(label: Icon(Icons.air)),
      DataColumn(label: Icon(Icons.air_outlined))
    ];
  }

  List<DataRow> _createRows() {
    return _info
        .map((info) => DataRow(cells: [
              DataCell(Text(info['Radon'])),
              DataCell(Text(info['Temp-inside'])),
              DataCell(Text(info['Temp-outside'])),
              DataCell(Text(info['Humidtiy-inside'])),
              DataCell(Text(info['Humidtiy-outside']))
            ]))
        .toList();
  }
}
