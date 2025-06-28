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

// Nested List and Record Matching

List<String> marksListValidator(List<(String, List<int>)> data){
  List<String> studentNames = [];
  for(var student in data){
    if (student case (String name, List<int> markList) when markList.any((marks) => marks > 24)){
      studentNames.add(name);
    }
  }
  return studentNames;
}

// Sealed Class and Nested Record Matching

sealed class FileSystemNode {}

class File implements FileSystemNode {
  final String name;
  final int size; // in bytes
  File(this.name, this.size);
}

class Folder implements FileSystemNode {
  final String name;
  final List<FileSystemNode> children;
  Folder(this.name, this.children);
}

class Symlink implements FileSystemNode {
  final String targetPath;
  Symlink(this.targetPath);
}

String describeNode(FileSystemNode node) {
  return switch (node) {
    File(:var name, :var size) when size > 1024 => "$name is a large file (${size} bytes)",
    File(:var name, :var size) => "$name is a small file (${size} bytes)",
    Folder(:var name, :var children) => "$name is a folder with ${children.length} items",
    Symlink(:var targetPath) => "Symlink to $targetPath",
  };
}
