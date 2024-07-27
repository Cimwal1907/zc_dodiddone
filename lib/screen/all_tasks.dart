import 'package:flutter/material.dart';
import '../widgets/task_item.dart';
class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  _TasksPageState createState() => _TasksPageState();
}
class _TasksPageState extends State<TasksPage> {
  // Пример данных задач (замените на свой источник данных)
  List<String> tasks = [
    'Купить продукты',
    'Закончить отчет по проекту',
    'Позвонить врачу',
    'Забронировать авиабилеты',
    'Прочитать книгу'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          title: tasks[index],
          description: 'Описание задачи',
          deadline: DateTime.now(),
        );
      },
    );
  }
}