import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
 late String  location;
 late String time;
 late String flag;
 late String url;
  bool? isDaytime;

 WorldTime({required this.location,required this.flag,required this.url});

Future<void> getTime() async {
  //   //simulate network request for ausername 
  //  await Future.delayed(Duration(seconds: 3),(){
       
  //   });
  //   //simulate network to get bio of the username
  // Future.delayed(Duration(seconds: 2),(){
       
  //   });
  try{
 Response response =await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
 Map data=jsonDecode(response.body);
 String datetime=data['datetime'];
 String offset=data['utc_offset'].substring(1,3);
//  print('datetime');
//  print('offset');
//Create a datetime object
DateTime now=DateTime.parse(datetime);
now=now.add(Duration(hours:int.parse(offset)));

//set the time property
isDaytime=now.hour>6 && now.hour<20 ? true : false;
time=DateFormat.jm().format(now);

  
  } 
  catch(e){
    print("Error is obtained $e");
    time='Could not get  time data';
  }

}
}
WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');