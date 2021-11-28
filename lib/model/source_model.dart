//let's start by making the source model class so
// it will be easier to parse the Json

class Source{
  String id;
  String name;

  //Let's create the constructor
Source({required this.id,required this.name});

factory Source.fromJson(Map<String,dynamic> json){
    return Source(id: json['id'], name: json['name']);
  }
}