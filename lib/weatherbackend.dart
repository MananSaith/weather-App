import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/hide.dart' ;

Future<Map<String,dynamic>> getcurrentweather () async {

try{
  var url= Uri.parse(
  "https://api.openweathermap.org/data/2.5/forecast?q=$city,$country&APPID=$key"
  );
    //final res= await http.get(url);
    //final res1=jsonDecode(res.body);
    //so i do in single line
  final res= jsonDecode((await http.get(url)).body);
  if(res["cod"]!="200"){
        throw (res["cod"]=="404")?"Error ${res["cod"]}\nPage Not Found":'An Unexpected Error Occoure';
    
  }
  return res;
}
  catch(e){ 
    throw "Network is Unstable\nMake Sure The Connection";
  }

}