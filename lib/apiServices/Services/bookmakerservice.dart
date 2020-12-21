
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../Models/sportmodels.dart';

class BookmakerService{


  Future<SportsModel> getSports() async{

    	Map<String,String> headers = {'Content-Type':'application/json'};	
    final String url = 'https://lds-api.ligastavok.ru/rest/events/v2/getSportsTree';
    var response = await http.post(url,headers: headers);

    if(response.statusCode == 200)
    {
      SportsModel result = SportsModel.fromJson(json.decode(response.body));
      print(response.statusCode.toString());
      return result;
    }else{
      return throw Exception('Unable to connect with server');
    }
  }
}