import 'package:flutter/material.dart';

void main() => runApp(
      const Bytebank(),
    );

class Bytebank extends StatelessWidget {
  const Bytebank({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a transfer'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.account_circle,
                  size: 32.0,
                ),
                border: OutlineInputBorder(),
                labelText: 'Account',
                hintText: '1000',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.monetization_on,
                  size: 32.0,
                ),
                border: OutlineInputBorder(),
                labelText: 'Value',
                hintText: '100.00',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Create'),
          )
        ],
      ),
    );
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
