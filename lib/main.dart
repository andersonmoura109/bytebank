import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Transfers'),
          ),
          body: Column(
            children: const [
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on,
                  ),
                  title: Text('100.00'),
                  subtitle: Text('1000'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.monetization_on,
                  ),
                  title: Text('200.00'),
                  subtitle: Text('1000'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
