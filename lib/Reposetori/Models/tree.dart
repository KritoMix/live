import 'package:live/Reposetori/Models/categories.dart';

class Tree {
  int id;
  
  String title;
  String sname;
  int count;
  List<Categories> categories;

  Tree(
      {this.id,
      
      this.title,
      this.sname,
      this.count,
      this.categories});

  Tree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['title'] = this.title;
    data['sname'] = this.sname;
    data['count'] = this.count;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}