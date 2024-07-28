import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Для форматирования даты
import '../screen/all_tasks.dart';
import '../screen/profile.dart';
import '../theme/theme.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _tasks = [];
  // Define the pages for each tab
  static final List<Widget> _widgetOptions = <Widget>[
    TasksPage(),
    Text('Сегодня'),
    Text('Выполнено'),
    // ignore: prefer_const_constructors
    ProfilePage(), // Use ProfilePage for the Profile tab
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _addTask(Map<String, dynamic> task) {
    setState(() {
      _tasks.add(task);
    });
  }
  void _showAddTaskDialog() {
    DateTime? _selectedDate;
    TimeOfDay? _selectedTime;
    String? title;
    String? description;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Добавить новую задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(hintText: "Введите заголовок"),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(hintText: "Введите описание"),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 25, color: Colors.green[600]),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Text(
                      _selectedDate == null
                          ? 'Выберите дату'
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 25, color: Colors.grey[600]),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _selectedTime = pickedTime;
                        });
                      }
                    },
                    child: Text(
                      _selectedTime == null
                          ? 'Выберите время'
                          : _selectedTime!.format(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Добавить'),
              onPressed: () {
                if (title != null && title!.isNotEmpty) {
                  DateTime deadline = DateTime(
                    _selectedDate?.year ?? DateTime.now().year,
                    _selectedDate?.month ?? DateTime.now().month,
                    _selectedDate?.day ?? DateTime.now().day,
                    _selectedTime?.hour ?? 0,
                    _selectedTime?.minute ?? 0,
                  );
                  _addTask({
                    'title': title!,
                    'description': description ?? '',
                    'deadline': deadline,
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}