import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transfers'),
          ),
          body: const TransferList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );

class TransferList extends StatelessWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(value: '100.00', account: '1000'),
        TransferItem(value: '200.00', account: '1001'),
        TransferItem(value: '300.00', account: '1002'),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final String value;
  final String account;

  TransferItem({required this.value, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
        ),
        title: Text(value),
        subtitle: Text(account),
      ),
    );
  }
}
