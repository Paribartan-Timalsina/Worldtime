import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//   void getTime() async {
//   //   //simulate network request for ausername 
//   //  await Future.delayed(Duration(seconds: 3),(){
       
//   //   });
//   //   //simulate network to get bio of the username
//   // Future.delayed(Duration(seconds: 2),(){
       
//   //   });
//  Response response =await get(Uri.parse('https://worldtimeapi.org/api/timezone/Australia/Brisbane'));
//  Map data=jsonDecode(response.body);
//  String datetime=data['datetime'];
//  String offset=data['utc_offset'].substring(1,3);
// //  print('datetime');
// //  print('offset');
// //Create a datetime object
// DateTime now=DateTime.parse(datetime);
// now=now.add(Duration(hours:int.parse(offset)));



//   }
String time='Loading';
void setupWorldTime() async {
  WorldTime instance=WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney');
await instance.getTime();
Navigator.pushReplacementNamed(context, '/home',arguments:({
  'location':instance.location,
  'flag':instance.flag,
  'time':instance.time,
  'isDaytime':instance.isDaytime,
}
));


}
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 185, 255),
            body:Center(
        
        child: 
       SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
),
      ),
    );
  }
}