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
  );

  print('XP inicial: ${player.xp}');

  final completed = habit.complete();

  if (completed) {
    RewardService.giveHabitReward(player, habit);
  }

  print('Completou: $completed');
  print('XP depois: ${player.xp}');

  final completedAgain = habit.complete();

  if (completedAgain) {
    RewardService.giveHabitReward(player, habit);
  }

  print('Completou novamente: $completedAgain');
  print('XP final: ${player.xp}');

  print('Level: ${player.level}');
print('XP: ${player.xp}');

player.addXp(250);

print('Level: ${player.level}');
print('XP: ${player.xp}');

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