import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController discriptioncontroller = TextEditingController();
  final List<String> category = ["Personal", "Work", " Casual"];
  final Map<String, Color> categoryColors = {
    "Personal": const Color.fromARGB(255, 122, 204, 125),
    "Work": const Color.fromARGB(255, 72, 95, 223),
    "Casual": const Color.fromARGB(255, 219, 162, 76),
  };

  late String selectedCateg;
  String id = "";
  List<Select> selected = [];

  @override
  void initState() {
    selectedCateg = category[0];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titlecontroller.dispose();
    discriptioncontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Select {
  late String id;
  bool checkValue = false;
  Select({required this.id, required this.checkValue});
}
