import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          body: TransferForm(),
        ),
      ),
    );

class TransferForm extends StatelessWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}

class TransferList extends StatelessWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: Column(
        children: [
          TransferItem(Transfer(value: 100.00, account: 1000)),
          TransferItem(Transfer(value: 200.00, account: 1001)),
          TransferItem(Transfer(value: 300.00, account: 1002)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.account.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int account;

  Transfer({required this.value, required this.account});
}
