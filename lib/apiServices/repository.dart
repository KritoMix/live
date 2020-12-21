
import 'package:live/apiServices/Models/sportmodels.dart';
import 'package:live/apiServices/Services/bookmakerservice.dart';

class Repository{
  final githubService = BookmakerService();

  Future<SportsModel> getSports() async{
    return githubService.getSports();
  }
}