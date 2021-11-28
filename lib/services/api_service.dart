import 'dart:convert';

import 'package:http/http.dart';
import 'package:limitedbox/model/article_model.dart';

//Now let's make the HTTP request services
// this class will allows us to male a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService{
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  final endPointUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=66b5a55516a24d118a228a1ab414f169';

  //Now let's create the http request function
// but first let's import the http package

  Future<List<Article>> getArticle() async{
      Response res = await get(endPointUrl);

      // first of all let's check that we got a 200 status code: this mean that the request was a success
    if(res.statusCode == 200){
Map<String,dynamic> json = jsonDecode(res.body);

List<dynamic> body = json['articles'];

// this line will allow us to get the different articles from the json file and putting them into a list
List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
return articles;
    }
    else{
      throw ("Can't get the Articles");
    }
  }
}