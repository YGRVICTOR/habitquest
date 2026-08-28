class Habit {
  final String id;
  final String name;
  final String icon;
  final int xp;
  final String frequency;
  final List<DateTime> completedDates;
  int streak = 0;

  Habit({
    required this.id,
    required this.name,
    required this.icon,
    required this.xp,
    required this.frequency,
    List<DateTime>? completedDates,
  }) : completedDates = completedDates ?? [];

  Habit.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      name = map['name'],
      icon = map['icon'],
      xp = map['xp'],
      frequency = map['frequency'],
      completedDates = (map['completedDates'] as List)
          .map((date) => DateTime.parse(date))
          .toList(),
      streak = map['streak'];


  bool complete() {
    if (hasMissedDays()) {
      streak = 0;
    }

    if (!isCompletedToday()) {
      completedDates.add(DateTime.now());
      streak++;
      return true;
    }

    return false;
  }

  bool isCompletedToday() {
    final today = DateTime.now();

    return completedDates.any((date) {
      return date.year == today.year &&
          date.month == today.month &&
          date.day == today.day;
    });
  }

  bool hasMissedDays() {
    if (completedDates.isEmpty) {
      return false;
    }

    final lastCompletedDate = completedDates.last;
    final today = DateTime.now();
    final difference = today.difference(lastCompletedDate).inDays;

    return difference > 1;
  }

Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'xp': xp,
      'frequency': frequency,
      'completedDates': completedDates.map((date) => date.toIso8601String()).toList(),
      'streak': streak,
    };
  }

}