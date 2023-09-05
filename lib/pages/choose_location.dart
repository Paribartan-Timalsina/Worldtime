import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter=0;
List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu', flag: 'nepal.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Indian/Cocos', location: 'India', flag: 'india.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Argentina', flag: 'argentina.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Pakistan', flag: 'pakistan.png'),
  ]; 

  void updateTime(index) async {
WorldTime instance =locations[index];
await instance.getTime();
//now we should navigate to home screen
Navigator.pop(context,{
'location':instance.location,
  'flag':instance.flag,
  'time':instance.time,
  'isDaytime':instance.isDaytime,
},);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    appBar: AppBar(
      title: Text("Select a Location"),
      centerTitle: true,
      elevation:10,
    ),
    body:ListView.builder(
      itemCount: locations.length,
      itemBuilder:(context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 6),
          child:Card(
  child: Container(
    color: Colors.grey[200], // Set your desired background color here
    child: ListTile(
      onTap: () {
        updateTime(index);
      },
      title: Text(locations[index].location,
      style: TextStyle(
        fontSize: 30,

      ),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/${locations[index].flag}'),
      ),
    ),
  ),
),

        );
      }
      ),
      );
    
  }
}