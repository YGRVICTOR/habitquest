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

Player.fromMap(Map<String, dynamic> map)
  : id = map['id']
    name = map['name']
    xp = map['xp']
    level = map ['level'];

void addXp(int amount) {
  xp += amount;

  while (xp >= 100) {
    xp -= 100;
    level++;
  }

}
MapString, dynamic> toMap(){
  return{
    'id': id,
    'name': name,
    'xp': xp,
    'level': level,
  }
}

}