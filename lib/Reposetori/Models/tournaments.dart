class Tournaments {
  int id;
  int gameId;
  int categoryId;
  int priority;
  int popularity;
  String title;
  String sname;
  int count;
  List<int> eventIds;

  Tournaments(
      {this.id,
      this.gameId,
      this.categoryId,
      this.priority,
      this.popularity,
      this.title,
      this.sname,
      this.count,
      this.eventIds});

  Tournaments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameId = json['gameId'];
    categoryId = json['categoryId'];
    priority = json['priority'];
    popularity = json['popularity'];
    title = json['title'];
    sname = json['sname'];
    count = json['count'];
    eventIds = json['eventIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gameId'] = this.gameId;
    data['categoryId'] = this.categoryId;
    data['priority'] = this.priority;
    data['popularity'] = this.popularity;
    data['title'] = this.title;
    data['sname'] = this.sname;
    data['count'] = this.count;
    data['eventIds'] = this.eventIds;
    return data;
  }
}
