import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Импорт пакета intl для форматирования даты

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;
  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    // Форматирование даты дедлайна
    String formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);
    // Определение уровня срочности задачи
    Duration timeUntilDeadline = deadline.difference(DateTime.now());
    Color gradientStart;
    if (timeUntilDeadline < Duration(days: 1)) {
      // Срочная задача
      gradientStart = Colors.red;
    } else if (timeUntilDeadline < Duration(days: 2)) {
      // Задача средней срочности
      gradientStart = Colors.yellow;
    } else {
      // Несрочная задача
      gradientStart = Colors.green;
    }
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок задачи с градиентом
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradientStart, Colors.white],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Цвет текста для лучшей читаемости
                    ),
                  ),
                ),
                // Кнопка редактирования
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку редактирования
                    // Например, можно открыть диалог редактирования
                    print('Редактировать задачу');
                  },
                  icon: const Icon(Icons.edit),
                ),
                // Кнопка удаления
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку удаления
                    // Например, можно показать диалог подтверждения удаления
                    print('Удалить задачу');
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Дедлайн: $formattedDeadline',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}