class PatternMatch {
  // Simple Pattern Match
  String returnString(Object variable){
    switch (variable){
      case int _ :
      return "Its an int";
      case String _:
      return "Its a String";
      default:
      return "Unknown Type"; 
    }
  }

   // Destructure a record
}
String describePerson((String,int) person){
    var (String name,int age) = person;
    return "Name : $name, Age = $age";  
  }

  // Simple List Pattern Matching 
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

  // Complex Destructuring of a List<Map<String,dynamic>>
  List<String> topScorers(List<Map<String, dynamic>> students){
    List<String> topScorersList = [];
    for(var map in students){
        if (map case {'name':String name,'score':int score} when score > 90){
          topScorersList.add(name);
        }
      }
    return topScorersList;
  }

  // Complex Destructuring of a List<(String,int)>

  List<String> adults(List<(String, int)> people) {
    List<String> adultNames = [];

    for (var person in people){
      if (person case (String name,int age) when age>18){
        adultNames.add(name);
      }
    }
    return adultNames;
}

// Complex Destructuring of a List of Nested Records

List<String> people(List<((String name, int age), String city)> people){
  List<String> names = [];
  for(var person in people){
    if (person case ((String name, int age), String city) when age > 20 && city == "Lahore"){
      names.add(name);
    }
  }
  return names;
}

// Destructuring a List of students for Students who performed login event

List<String> userEventValidator(List<Map<String,dynamic>> userEventList){
  List<String> userLogInList = [];
  for(var map in userEventList){
    if(map case {'event':String event,'user':String name,"timestamp":int timestamp}when event == "login"){
      userLogInList.add(name);
    }
  }
  return userLogInList;
}

// Matching a sealed class using switch case

sealed class ApiResponse {}

class Success implements ApiResponse {
  final String data;
  Success(this.data);
}

class Failure implements ApiResponse {
  final String error;
  Failure(this.error);
}

String validateAPIResponse(ApiResponse response){
  return switch (response) {
    Success(data:var data) => "Success = <$data>",
    Failure(error:var error) => "Faliure = <$error>"
  };
}

// Destructoring a Map<String,int>

List<String> checkStock(Map<String,int> productList){
  List<String> productsInStock = [];
  for(var product in productList.entries){
    if(product case MapEntry(key:var key, value: var value)when value >0){
      productsInStock.add(key);
    }
  }
  return productsInStock;
}