import 'dart:convert';

class User {
  int id;
  String firstname;
  String lastname;
  String avatarurl;

  User(this.id, this.firstname, this.lastname, this.avatarurl);

  factory User.toJson(String body) {
    var parsedJson = jsonDecode(body)["data"];
    return User(parsedJson["id"], parsedJson["first_name"],
        parsedJson["last_name"], parsedJson["avatar"]);
  }
}
