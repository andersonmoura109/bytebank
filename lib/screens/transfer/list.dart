import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

import '../../models/transfer.dart';

class TransferList extends StatefulWidget {
  TransferList({super.key});

  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  final String _appBarTitle = 'Transfers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: widget._transfers.isNotEmpty
          ? ListView.builder(
              itemCount: widget._transfers.length,
              itemBuilder: (context, index) {
                final Transfer transfer = widget._transfers[index];
                return TransferItem(transfer);
              },
            )
          : const Center(
              child: Text(
                'Enter a transfer',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const TransferForm();
            }),
          ).then(
            (transfer) => {
              if (transfer != null) updateList(transfer),
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void updateList(Transfer transfer) =>
      setState(() => widget._transfers.add(transfer));
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
