import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const Bytebank(),
    );

class Bytebank extends StatelessWidget {
  const Bytebank({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.green,
            onPrimary: Colors.white,
            secondary: Colors.blue,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.redAccent,
            background: Colors.red,
            onBackground: Colors.white10,
            surface: Colors.black,
            onSurface: Colors.black12),
      ),
      home: TransferList(),
    );
  }
}
