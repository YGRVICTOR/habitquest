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
}