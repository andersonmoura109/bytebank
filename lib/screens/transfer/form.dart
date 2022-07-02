import 'package:flutter/material.dart';

import '../../components/edit_field.dart';
import '../../models/transfer.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  final String _appBarTitle = 'Create a transfer';

  final String _accountLabel = 'Account';
  final String _accountHint = '1000';

  final String _valueLabel = 'Value';
  final String _valueHint = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditField(
                controller: _accountController,
                label: _accountLabel,
                hint: _accountHint,
                icon: Icons.account_balance),
            EditField(
                controller: _valueController,
                label: _valueLabel,
                hint: _valueHint,
                icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => {
                _createTransfer(context),
              },
              child: const Text('Create'),
            )
          ],
        ),
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
            ),
          ),
          duration: const Duration(milliseconds: 2000),
          width: 200,
          padding: const EdgeInsets.all(16.0),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

      Navigator.pop(context, createdTransfer);
    }
  }
}
