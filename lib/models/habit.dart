class Habit {
  final String id;
  final String name;
  final String icon;
  final int xp;
  final String frequency;
  final List<DateTime> completedDates;

  Habit({
    required this.id,
    required this.name,
    required this.icon,
    required this.xp,
    required this.frequency,
    List<DateTime>? completedDates,
  }) : completedDates = completedDates ?? [];

  bool complete() {
    if (!isCompletedToday()) {
      completedDates.add(DateTime.now());
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
}