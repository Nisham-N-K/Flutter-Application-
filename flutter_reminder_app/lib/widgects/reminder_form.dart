import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/remainder_model.dart';

class ReminderForm extends StatelessWidget {
  const ReminderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reminderModel = Provider.of<ReminderModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: reminderModel.selectedDay,
          items: reminderModel.daysOfWeek.map((String day) {
            return DropdownMenuItem<String>(
              value: day,
              child: Text(day),
            );
          }).toList(),
          onChanged: (String? newValue) {
            reminderModel.setSelectedDay(newValue!);
          },
        ),
        DropdownButton<String>(
          value: reminderModel.selectedActivity,
          items: reminderModel.activities.map((String activity) {
            return DropdownMenuItem<String>(
              value: activity,
              child: Text(activity),
            );
          }).toList(),
          onChanged: (String? newValue) {
            reminderModel.setSelectedActivity(newValue!);
          },
        ),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: reminderModel.selectedTime,
            );
            if (time != null) {
              reminderModel.setSelectedTime(time);
            }
          },
          child: Text('Select Time: ${reminderModel.selectedTime.format(context)}'),
        ),
        ElevatedButton(
          onPressed: () {
            reminderModel.scheduleNotification();
          },
          child: const Text('Schedule Reminder'),
        ),
      ],
    );
  }
}
