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
        body: TransferList(),
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
              _createTransfer(context),
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? account = int.tryParse(_accountController.text);
    final double? value = double.tryParse(_valueController.text);
    if ((account != null) && (value != null)) {
      final createdTransfer = Transfer(value: value, account: account);

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

      Navigator.pop(context, createdTransfer);
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
  TransferList({super.key});

  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: _transfers.isNotEmpty
          ? ListView.builder(
              itemCount: _transfers.length,
              itemBuilder: (context, index) {
                final Transfer transfer = _transfers[index];
                return TransferItem(transfer);
              },
            )
          : const Center(
              child: Text(
                'Enter a new transfer',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.amber,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> receivedTransfer = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          );

          receivedTransfer.then((transfer) => {
                _transfers.add(transfer!),
                debugPrint('Enter the future return'),
                debugPrint('$transfer'),
              });
        },
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
