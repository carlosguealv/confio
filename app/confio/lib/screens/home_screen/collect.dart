import 'package:flutter/material.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController venceProntoController = TextEditingController();
  TextEditingController vendraLuegoController = TextEditingController();
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    venceProntoController.dispose();
    vendraLuegoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
