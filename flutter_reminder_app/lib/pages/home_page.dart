import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/remainder_model.dart';
import '../widgects/reminder_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ReminderForm(),
      ),
    );
  }
}
