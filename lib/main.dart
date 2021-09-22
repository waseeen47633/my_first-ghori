import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:untitled2/Sqlite.dart';
//import 'package:flutter_dummy/Sqlite/model_dummy.dart';
//import 'package:flutter_dummy/post_info/screens/screen_all_post.dart';
import 'package:untitled2/screens/all_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,


      ),
      home: const ScreenAllPost(),


    );
  }

}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final text_style = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
//
//   Future<List<ModelDummy>> future_builder;
//
//   DatabaseDummy databaseDummy = DatabaseDummy();
//
//   @override
//   void initState() {
//     super.initState();
//
//     databaseDummy.initializeDatabase().then((value) {
//       future_builder = databaseDummy.getUser();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dummy Screen"),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.lerp(EdgeInsets.all(20), EdgeInsets.all(10), 0.5),
//         child: FutureBuilder(
//             future: future_builder,
//             builder: (context, AsyncSnapshot<List<ModelDummy>> snapshot) {
//               if (snapshot.hasError) {
//                 return Container(
//                   child: Center(
//                     child: Text("Sorry error occured"),
//                   ),
//                 );
//               } else {
//                 if (snapshot.hasData) {
//                   if (snapshot.data.length > 0) {
//                     return ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           child: Text(snapshot.data[index].name),
//                         );
//                       },
//                     );
//                   } else {
//                     return Container(
//                       child: Center(
//                         child: Text("Sorry Zero occured"),
//                       ),
//                     );
//                   }
//                 } else {
//                   return Container(
//                     child: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }
//               }
//             }),
//       ),
//     );
//   }
//}
