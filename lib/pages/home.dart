import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map? data;
  @override
  Widget build(BuildContext context) {
    //if(ModalRoute.of(context)!.settings.arguments!=null){
    //data=data.isNotEmpty?data: ModalRoute.of(context)!.settings.arguments as Map;
   data = data?.isNotEmpty == true ? data : ModalRoute.of(context)!.settings.arguments as Map;


   // }     

     //set background
     String bgImage=data?['isDaytime']?'day.jpeg':'night.jpg';
    return Scaffold(
      // appBar: AppBar(
      //   title:Text('My app'),
      // ),
      backgroundColor: Colors.blue,
      body:SafeArea(
        
        child:Container(
          decoration:BoxDecoration(
            image:DecorationImage(image: AssetImage('assets/$bgImage'),
            fit:BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), // Adjust opacity here (0.5 for 50% transparency)
      BlendMode.dstATop, // This blend mode makes the image transparent
    ),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,200.0,0,0),
            child: Column(
              children:<Widget> [
                ElevatedButton.icon(
                  onPressed: ()async{
                  dynamic result= await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'flag':result['flag'],
                      'isDaytime':result['isDaytime'],

                    };
                  });
                  },
                   style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 20, 127, 151), // Background color
  ),
                   icon: Icon(Icons.edit_location,
                   color: Colors.grey[100],
                   ),
                   label: Text('Choose Location',
                   style: TextStyle(
                    color:Colors.white,
                    fontSize: 20,
                   ),
                   )),
                   
                   SizedBox(height:20.0),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                           Text(
                            data?['location'],
                            style:TextStyle(
                              fontSize:50.0,
                              letterSpacing:2,
                              color:Colors.white,
                            ),
                            
                          ),
                          ]
                        ),
                     SizedBox(height:20),
                     Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ClipOval(
      child: Image.asset(
        'assets/${data?['flag']}',
        width: 100.0, // Adjust the width as needed for the circular image
        height: 100.0, // Adjust the height as needed for the circular image
        fit: BoxFit.cover, // You can adjust BoxFit as needed
      ),
    ),
  ],
),

                   
                   SizedBox(height:20.0),
                   Text(
                    data?['time'],
                    style: 
                    TextStyle(
                      fontSize: 80.0,
                      color:Colors.white,
                    ),
                   )
              ],
              ),
          ),
        ) 
      ),
    );
  }
}



















// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   Map? data = {};

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     data = ModalRoute.of(context)!.settings.arguments as Map;

//     // set background image
//     String bgImage = data!['isDaytime'] ? 'day.png' : 'night.png';
//     Color? bgColor = data!['isDaytime'] ? Colors.blue : Colors.indigo[700];

//     return Scaffold(
//       backgroundColor: bgColor,
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/$bgImage'),
//               fit: BoxFit.cover,
//             )
//           ),
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(100, 200.0, 0, 0),
//             child: Column(
//               children: <Widget>[
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/location');
//                   },
//                   icon: Icon(
//                     Icons.edit_location,
//                     color: Colors.grey[300],
//                   ),
//                   label: Text(
//                     'Edit Location',
//                     style: TextStyle(
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       data!['location'],
//                       style: TextStyle(
//                         fontSize: 28.0,
//                         letterSpacing: 2.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.0),
//                 Text(
//                   data!['time'],
//                   style: TextStyle(
//                     fontSize: 66.0,
//                     color: Colors.white
//                   )
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }