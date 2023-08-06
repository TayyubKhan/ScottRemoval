import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/view/signature_view.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    final signature = Provider.of<SignatureProvider>(context);
    return Scaffold(
      body: Image.memory(signature.signatureBytes!),
    );
  }
}
