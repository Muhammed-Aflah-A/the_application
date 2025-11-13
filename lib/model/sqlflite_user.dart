class SqfliteUser {
  int? id;
  String username;
  String gmail;
  SqfliteUser({this.id, required this.username, required this.gmail});
  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'gmail': gmail};
  }

  factory SqfliteUser.fromMap(Map<String, dynamic> map) {
    return SqfliteUser(
      id: map['id'],
      username: map['username'],
      gmail: map['gmail'],
    );
  }
}
