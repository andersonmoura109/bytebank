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
          EditField(
              controller: _accountController,
              label: 'Account',
              hint: '1000',
              icon: Icons.account_circle),
          EditField(
              controller: _valueController,
              label: 'Value',
              hint: '100.0',
              icon: Icons.monetization_on),
          ElevatedButton(
            onPressed: () => {
              _createTransfer,
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Test',
                    style: TextStyle(
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
              ),
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  void _createTransfer() {
    final int? account = int.tryParse(_accountController.text);
    final double? value = double.tryParse(_valueController.text);
    if ((account != null) && (value != null)) {
      Transfer(value: value, account: account);
    }
  }
}

class EditField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  const EditField(
      {required this.controller, this.label, this.hint, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16, 24.0, 16),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  size: 32.0,
                )
              : null,
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
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
