import '/models/habit.dart';
import '/models/player.dart';

class RewardService {
  static void giveHabitReward(Player player, Habit habit) {
    player.addXp(habit.xp);
    }
  }
     