import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limitedbox/components/customListTile.dart';
import 'package:limitedbox/model/article_model.dart';
import 'package:limitedbox/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: HomePage(),
    );}}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App",style: TextStyle(
          color: Color(0xff222222))),
          backgroundColor: Colors.white,
        ),

      //Now let's call the API services with futurebuilder widget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context,AsyncSnapshot<List<Article>>snapshot){
          //let's check if we got a response or not
          if (snapshot.hasData){
            //Now let's make a list of articles
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, int index)=>
                customListTile(articles[index],context),
            );
          }

          return Center(child: CircularProgressIndicator(),);

        },
      ),
      );

  }
}
