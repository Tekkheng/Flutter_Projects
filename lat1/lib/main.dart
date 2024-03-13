// import 'package:flutter/material.dart';

// void main(){
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return const MaterialApp(
//       title: 'First Project',
//       home: MyScreen(),
//     );
//   }
// }

// class MyScreen extends StatelessWidget{
//   const MyScreen({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//           leading: const IconButton(
//           icon: Icon(Icons.menu),
//           tooltip: 'Navigation menu',
//           onPressed: null,
//         ),
//         title: const Text('Title'),
//       ),
//       body: const Center(
//         child: Text('First'),
//       ),
//     );
//   }
// }
// class MyScreen extends StatelessWidget{
//   const MyScreen({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         leading: const IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: null,
//         ),
//         title: const Text('Example title'),
//       ),
//       body: Center(
//         child: Text('My Name Akheng'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(title:'first',home:Scaffold(body:Center(child: Text("tengah Yak!"),))));
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const FirstApp());
// }

// class FirstApp extends StatelessWidget {
//   const FirstApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'first',
//       home: MyScreen(),
//     );
//   }
// }

// class MyScreen extends StatelessWidget {
//   const MyScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('yuhuuuuu!'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home:Scaffold(appBar: AppBar(backgroundColor: Colors.green,title:Text('appbar boss')),body:const Center(child: Text('myhouse')))));
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Latihan1',
//       home: ScreenApp(),
//     );
//   }
// }

// class ScreenApp extends StatelessWidget {
//   const ScreenApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 64, 22, 71),
//         title: const Center(
//           child: Text('hhoohohoh'),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 143, 143, 9),
//               Color.fromARGB(255, 200, 156, 117)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         // alignment: Alignment.center,
//         padding: EdgeInsets.only(top:380),
//         // color: Colors.amber,
//         // decoration: BoxDecoration(color: Colors.black),
//         child: Center(
//           child: const Text(
//             'A B C D',
//             style: TextStyle(color: Colors.white,fontSize: 28),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Lat2());
// }

// class Lat2 extends StatelessWidget {
//   const Lat2({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'second Project',
//       home: LayarUtama(),
//     );
//   }
// }

// class LayarUtama extends StatelessWidget {
//   const LayarUtama({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text('AppBar'),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 222, 113, 113),
//               Color.fromARGB(255, 216, 22, 22)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: const Center(
//             child: Text('hello World',
//                 style: TextStyle(color: Colors.green, fontSize: 30))),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:lat1/styledtext.dart';
import 'navbar.dart';

import 'package:lat1/dice_roller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'firstProject',
      home: MyScreen(),
    );
  }
}

// class MyScreen extends StatelessWidget {
//   const MyScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: MyAppBar(),
//       body: ContainerBodyGradient(Color.fromARGB(137, 187, 66, 66),Color.fromARGB(26, 232, 164, 20)),
//       );
//   }
// }

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: ContainerBodyGradient(
          [Color.fromARGB(255, 104, 9, 93), Color.fromARGB(255, 88, 15, 84)]),
    );
  }
}

// class ContainerBodyGradient extends StatelessWidget{
//   const ContainerBodyGradient(this.firstColor,this.secondColor,{super.key});

//   final Color firstColor,secondColor;

//   @override
//   Widget build(BuildContext context){
//     return Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               firstColor,
//               secondColor,
//             ],
//             begin: Alignment.centerRight,
//             end: Alignment.topLeft,
//           ),
//         ),
//         child: const Center(
//           child: StyledText('Akheng'),
//         ),
//     );
//   }
// }

class ContainerBodyGradient extends StatelessWidget {
  const ContainerBodyGradient(this.myColors, {super.key});

  final List<Color> myColors;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: myColors,
            begin: Alignment.centerRight,
            end: Alignment.topLeft,
          ),
        ),

        // child: StyledText('Akheng'),
        child: const DiceRoller()
        // OutlinedButton(
        //   onPressed: (){},
        //   child: const Text('Save Me'),
        // ),

        // TextButton(onPressed: onPressed, child: child)

        // ClipRRect(
        //   child: Image.asset('assets/images/dice-1.png',width: 200),
        // ),

        );
  }
}
