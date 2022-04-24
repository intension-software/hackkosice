class Missions {
  Missions({required this.missions});
  final Map<String, void> missions;


  factory Missions.fromJson(Map<String, dynamic> json) {
    return Missions(
      missions: json.map((k, v) => MapEntry(k, print(v))),
    );
  }
}

class Mission{
  Mission({required this.id, required this.text, required this.state, required this.due, required this.reward});

  final int id;
  final String text;
  final String state;
  final String due;
  final Map<String, dynamic> reward;


factory Mission.fromJson(Map<String, dynamic> json) {
  return Mission(
    id: json['id'],
    text: json['text'],
    state: json['state'],
    due: json['due'],
    reward: json['reward'],

    );
  }
}