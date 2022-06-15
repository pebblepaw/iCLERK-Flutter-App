// main.dart
import 'package:flutter/material.dart';



class datepicker extends StatelessWidget {
  const datepicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Apply Leave',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTimeRange? _selectedDateRange;

  // This function will be triggered when the floating button is pressed
  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      helpText: "Choose the days",
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Leave')),
      body: Column(children: [
        _selectedDateRange == null
            ? const Center(
          child: Text('Press the button to show the picker'),
        )
            : Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Start date
              Text(
                "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
                style: const TextStyle(fontSize: 24, color: Colors.blue),
              ),
              const SizedBox(
                height: 20,
              ),
              // End date
              Text(
                  "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
                  style: const TextStyle(fontSize: 24, color: Colors.red))
            ],
          ),
        ),

        // This button is used to show the date range picker

        ElevatedButton(onPressed: _show,
          child: const Icon(Icons.date_range),
        ),
        ElevatedButton(onPressed: () {
          Navigator.pop(
            context
          );
        },
         child: const Text("Back"),),

      ],)
    );
  }
}