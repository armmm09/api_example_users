class Users {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? gender;
  String? email;
  String? image;

  Users({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.email,
    this.image,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        age: json['age'] as int?,
        gender: json['gender'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'gender': gender,
        'email': email,
        'image': image,
      };

}
