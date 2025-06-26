import 'dart:io';
import 'dart:vmservice_io';

class PatternMatch {
  String returnString(Object variable){
    switch (variable.runtimeType){
      case int _ :
      return "Its an int";
      case String _:
      return "Its a String";
      default:
      return "Unknown Type"; 
    }
  }

   
}
String describePerson((String,int) person){
    var (String name,int age) = person;
    return "Name : $name, Age = $age";  
  }
  String listLengthCategory(List<int> nums){
    switch (nums){
      case [var a,var b]:
        return "Its a pair";
      case [var a,var b,var c]:
      return "Triple";
      default:
      return "Long List";
    }
  }
  List<String> topScorers(List<Map<String, dynamic>> students){
    List<String> topScorersList = [];
    for(var map in students){
        if (map case {'name':String name,'score':int score} when score > 90){
          topScorersList.add(name);
        }
      }
    return topScorersList;
  }

  List<String> adults(List<(String, int)> people) {
    List<String> adultNames = [];

    for (var person in people){
      if (person case (String name,int age) when age>18){
        adultNames.add(name);
      }
    }
    return adultNames;
}

List<String> people(List<((String name, int age), String city)> people){
  List<String> names = [];
  for(var person in people){
    if (person case ((String name, int age), String city) when age > 20 && city == "Lahore"){
      names.add(name);
    }
  }
  return names;
}