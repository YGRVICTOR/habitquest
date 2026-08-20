class Player {
  final String id;
  final String name;
  int level;
  int xp;
  int streak;

Player({
  required this.id,
  required this.name,
  this.level = 1,
  this.xp = 0,
  this.streak = 0,
});

void addXp(int amount) {
  xp += amount;

}
}