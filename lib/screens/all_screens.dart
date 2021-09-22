import 'package:flutter/material.dart';
import 'package:untitled2/model/model_post.dart';

//import 'package:flutter_dummy/post_info/model/model_post.dart';
import 'package:untitled2/services/http_service.dart';

class ScreenAllPost extends StatefulWidget {
  const ScreenAllPost({Key key}) : super(key: key);

  @override
  _ScreenAllPostState createState() => _ScreenAllPostState();
}

class _ScreenAllPostState extends State<ScreenAllPost> {
  Future<List<Modelposts>> future_builder;

  @override
  void initState() {
    super.initState();

    //future_builder = HttpService.GetAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Screen"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.lerp(EdgeInsets.all(20), EdgeInsets.all(10), 0.5),
        child: (future_builder == null) ? ElevatedButton(onPressed: () {
          HttpService.insertIntoApi();
        },
     child: Text("INsertion")):FutureBuilder(
            future: future_builder,
            builder: (context, AsyncSnapshot<List<Modelposts>> snapshot) {
              if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text("Sorry error occured"),
                  ),
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Text(snapshot.data[index].title),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text("Sorry Zero occured"),
                      ),
                    );
                  }
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
