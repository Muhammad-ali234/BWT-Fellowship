class NotesModel {
  final int? id;
  // final int age;
  final String title, description;
  //  email;

  NotesModel({
    this.id,
    // required this.age,
    required this.title,
    required this.description,
    // required this.email
  });

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        // age = res['age'],
        title = res['title'],
        description = res['description'];
  // email = res['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      // 'age': age,
      'title': title,
      'description': description,
      // 'email': email
    };
  }
}
