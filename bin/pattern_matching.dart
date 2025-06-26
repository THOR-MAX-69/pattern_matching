import 'pattern_match.dart';
void main(List<String> arguments) {
  var list = [1,2,3];
  var person = ("Ahmed",20);
  print(describePerson(person));
  print(listLengthCategory(list));

  List<Map<String, Object>> students = [
  {"name": "Alice", "score": 95},
  {"name": "Bob", "score": 88},
  {"name": "Charlie", "score": 91},
  {"name": "Diana", "score": 72},
  {"name": "Ethan", "score": 99},
  {"name": "Fiona", "score": 85},
];

print(topScorers(students));

List<(String, int)> people = [
  ("Alice", 22),
  ("Bob", 17),
  ("Charlie", 19),
  ("Diana", 16),
  ("Ethan", 25),
  ("Fiona", 18),
];

print(adults(people));

List<((String, int), String)> peopleList = [
  (("Alice", 22), "Lahore"),
  (("Bob", 19), "Karachi"),
  (("Charlie", 25), "Lahore"),
  (("Diana", 17), "Lahore"),
  (("Ethan", 30), "Islamabad"),
  (("Fiona", 21), "Lahore"),
];

print(people(peopleList));
}
