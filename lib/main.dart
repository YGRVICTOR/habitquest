// ignore_for_file: avoid_print

import 'package:flutter/material.dart';


import 'models/habit.dart';
import 'models/player.dart';
import 'services/reward_service.dart';

  void main() {
  final player = Player(
    id: '1',
    name: 'Victor',
  );

  final habit = Habit(
    id: '1',
    name: 'Estudar Flutter',
    icon: '📚',
    xp: 50,
    frequency: 'Todos os dias',
    completedDates: [
      DateTime.now().subtract(const Duration(days: 2)),
    ],
  );

  print('Streak antes: ${habit.streak}');
  print('Perdeu algum dia: ${habit.hasMissedDays()}');

  final completed = habit.complete();

  if (completed) {
    RewardService.giveHabitReward(player, habit);
  }

  print('Completou: $completed');
  print('Streak depois: ${habit.streak}');
  print('XP depois: ${player.xp}');

  runApp(const MyApp());
}
 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('HabitQuest'),
        ),
      ),
    );
  }
}