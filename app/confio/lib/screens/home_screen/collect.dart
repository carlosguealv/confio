import 'package:confio/screens/home_screen/widget/collectTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController venceProntoController = TextEditingController();
  TextEditingController vendraLuegoController = TextEditingController();
  DateTime today = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
