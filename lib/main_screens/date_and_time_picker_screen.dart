
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renta/main_screens/vehicle_list_screen.dart';

class DateAndTimePickerScreen extends StatefulWidget {
  @override
  _DateAndTimePickerScreenState createState() =>
      _DateAndTimePickerScreenState();
}

class _DateAndTimePickerScreenState extends State<DateAndTimePickerScreen> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(Duration(days: 2));
  TimeOfDay selectedStartTime = TimeOfDay.now(); // Alış saati için eklenen değişken
  TimeOfDay selectedEndTime = TimeOfDay.now(); // Teslim saati için eklenen değişken

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: selectedStartDate,
        end: selectedEndDate,
      ),
    );
    if (picked != null && picked.start != selectedStartDate && picked.end != selectedEndDate) {
      setState(() {
        selectedStartDate = picked.start;
        selectedEndDate = picked.end;
      });
    }
  }

  void _selectTime(BuildContext context, bool isStart) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            minuteInterval: 60,
            initialDateTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              isStart ? selectedStartTime.hour : selectedEndTime.hour,
            ),
            onDateTimeChanged: (DateTime newTime) {
              setState(() {
                final time = TimeOfDay.fromDateTime(newTime);
                if (isStart) {
                  selectedStartTime = time;
                } else {
                  selectedEndTime = time;
                }
              });
            },
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarih ve Saat Seçimi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _DateTile(
                      title: 'Alış Tarihi',
                      date: selectedStartDate,
                      icon: Icons.calendar_today,
                      onTap: () => _selectDateRange(context),
                    ),
                  ),
                  VerticalDivider(color: Colors.orange, thickness: 1),
                  Expanded(
                    child: _DateTile(
                      title: 'Teslim Tarihi',
                      date: selectedEndDate,
                      icon: Icons.calendar_today,
                      onTap: () => _selectDateRange(context),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _TimeTile(
                      title: 'Alış Saati',
                      time: selectedTime,
                      icon: Icons.access_time,
                      onTap: () => _selectTime(context, true),
                    ),
                  ),
                  VerticalDivider(color: Colors.orange, thickness: 1),
                  Expanded(
                    child: _TimeTile(
                      title: 'Teslim Saati',
                      time: selectedTime,
                      icon: Icons.access_time,
                      onTap: () => _selectTime(context,false),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: CalendarDatePicker(
                initialDate: selectedStartDate,
                firstDate: DateTime.now().subtract(Duration(days: 1)),
                lastDate: DateTime(2025),
                onDateChanged: (date) {
                  setState(() {
                    if (selectedStartDate.isBefore(selectedEndDate)) {
                      selectedStartDate = date;
                    } else {
                      selectedEndDate = date.add(Duration(days: 1));
                    }
                  });
                },
                selectableDayPredicate: (DateTime date) {
                  return date.isAfter(DateTime.now().subtract(Duration(days: 1)));
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(

        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => RentACarScreen()));
                // Onay butonunun işlevi
              },
              child: Text('Onayla'),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final String title;
  final DateTime date;
  final IconData icon;
  final VoidCallback onTap;

  const _DateTile({
    Key? key,
    required this.title,
    required this.date,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${date.day}/${date.month}/${date.year}'),
      leading: Icon(icon, color: Colors.orange),
      onTap: onTap,
    );
  }
}

class _TimeTile extends StatelessWidget {
  final String title;
  final TimeOfDay time;
  final IconData icon;
  final VoidCallback onTap;

  const _TimeTile({
    Key? key,
    required this.title,
    required this.time,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${time.hour}:${time.minute}'),
      leading: Icon(icon, color: Colors.orange),
      onTap: onTap,
    );
  }
}
