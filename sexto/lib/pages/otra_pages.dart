import 'package:flutter/material.dart';

class OtraPagina extends StatelessWidget {
  const OtraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("otra Pages"),
      ),
      body: const Center(
    child: Text("otra Page"),
      ),
    );
  }
}
