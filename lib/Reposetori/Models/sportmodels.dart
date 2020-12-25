import 'package:live/Reposetori/Models/tree.dart';

class Send {
  Null id;
  Result result;
  Null error;
  int httpCode;

  Send({this.id, this.result, this.error, this.httpCode});

  Send.fromJson(Map<String, dynamic> json) {
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
 

  Result({this.tree});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['tree'] != null) {
      tree = new List<Tree>();
      json['tree'].forEach((v) {
        tree.add(new Tree.fromJson(v));
      });
    }
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tree != null) {
      data['tree'] = this.tree.map((v) => v.toJson()).toList();
    }
    
    return data;
  }
}





