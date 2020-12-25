import 'package:live/Reposetori/Models/tournaments.dart';

class Categories {
  int id;
  int gameId;
  int priority;
  String title;
  String sname;
  int count;
  List<Tournaments> tournaments;

  Categories(
      {this.id,
      this.gameId,
      this.priority,
      this.title,
      this.sname,
      this.count,
      this.tournaments});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameId = json['gameId'];
    priority = json['priority'];
    title = json['title'];
    sname = json['sname'];
    count = json['count'];
    if (json['tournaments'] != null) {
      tournaments = new List<Tournaments>();
      json['tournaments'].forEach((v) {
        tournaments.add(new Tournaments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gameId'] = this.gameId;
    data['priority'] = this.priority;
    data['title'] = this.title;
    data['sname'] = this.sname;
    data['count'] = this.count;
    if (this.tournaments != null) {
      data['tournaments'] = this.tournaments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}