class SportsModel {
  Null id;
  Result result;
  Null error;
  int httpCode;

  SportsModel({this.id, this.result, this.error, this.httpCode});

  SportsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    error = json['error'];
    httpCode = json['httpCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['error'] = this.error;
    data['httpCode'] = this.httpCode;
    return data;
  }
}

class Result {
  List<Tree> tree;
  List<Popular> popular;

  Result({this.tree, this.popular});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['tree'] != null) {
      tree = new List<Tree>();
      json['tree'].forEach((v) {
        tree.add(new Tree.fromJson(v));
      });
    }
    if (json['popular'] != null) {
      popular = new List<Popular>();
      json['popular'].forEach((v) {
        popular.add(new Popular.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tree != null) {
      data['tree'] = this.tree.map((v) => v.toJson()).toList();
    }
    if (this.popular != null) {
      data['popular'] = this.popular.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tree {
  int id;
  int priority;
  String title;
  String sname;
  int count;
  List<Categories> categories;

  Tree(
      {this.id,
      this.priority,
      this.title,
      this.sname,
      this.count,
      this.categories});

  Tree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
    title = json['title'];
    sname = json['sname'];
    count = json['count'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priority'] = this.priority;
    data['title'] = this.title;
    data['sname'] = this.sname;
    data['count'] = this.count;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
class Popular {
  int id;
  int gameId;
  int categoryId;
  int priority;
  int popularity;
  String title;
  String sname;
  int count;
  List<int> eventIds;

  Popular(
      {this.id,
      this.gameId,
      this.categoryId,
      this.priority,
      this.popularity,
      this.title,
      this.sname,
      this.count,
      this.eventIds});

  Popular.fromJson(Map<String, dynamic> json) {
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