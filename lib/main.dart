import 'package:flutter/material.dart';

void main() => runApp(
      const Bytebank(),
    );

class Bytebank extends StatelessWidget {
  const Bytebank({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  TransferForm({super.key});

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a transfer'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
            child: TextField(
              controller: _accountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
            child: TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
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
            onPressed: () {
              final int? account = int.tryParse(_accountController.text);
              final double? value = double.tryParse(_valueController.text);
              if ((account != null) && (value != null)) {
                final createdTransfer =
                    Transfer(value: value, account: account);
                debugPrint(createdTransfer.toString());

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      createdTransfer.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: const Duration(milliseconds: 3000),
                    width: 300,
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.orange,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }
            },
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

  @override
  String toString() {
    return 'Created transfer to Account: $account with the Value: $value';
  }
}
