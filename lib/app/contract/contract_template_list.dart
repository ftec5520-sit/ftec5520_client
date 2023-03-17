import 'package:flutter/material.dart';

class ContractTemplateList extends StatefulWidget {
  const ContractTemplateList({super.key});

  @override
  _ContractTemplateListState createState() => _ContractTemplateListState();
}

class _ContractTemplateListState extends State<ContractTemplateList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contract Template List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Back',
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'start',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'end',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}