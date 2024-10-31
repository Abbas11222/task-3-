// user.dart
class User {
  String id;
  String username;
  String email;
  int points;
  int currentLevel;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.points = 0,
    this.currentLevel = 1,
  });

  // Convert User object to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'points': points,
      'currentLevel': currentLevel,
    };
  }

  // Create a User object from a Map (retrieved from database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      points: map['points'],
      currentLevel: map['currentLevel'],
    );
  }
}
