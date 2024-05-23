import 'package:flutter/material.dart';
import '../widgects/reminder_form.dart';
import '../shedule/scheduled_reminders_page.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScheduledRemindersPage()),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
