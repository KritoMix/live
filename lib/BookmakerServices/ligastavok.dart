
import 'package:http/http.dart' as http;
import 'package:live/BookmakerServices/IBookmakerService.dart';
import 'package:live/Reposetori/Models/tree.dart';

import 'dart:convert';

import '../Reposetori/Models/sportmodels.dart';

class LigaStavok extends IBookmakerService
{

  Future<List<Tree>> getSports() async{

    	Map<String,String> headers = {'Content-Type':'application/json'};	
    final String url = 'https://lds-api.ligastavok.ru/rest/events/v2/getSportsTree';
    var response = await http.post(url,headers: headers);

    if(response.statusCode == 200)
    {
      Send send = Send.fromJson(json.decode(response.body));
      return send.result.tree;
    }else{
      return throw Exception('Unable to connect with server');
    }
  }
}