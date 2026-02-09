class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json['id'] as int , name: json['name'] as String? ?? 'N/A',
     username: json['username'] as String? ?? 'N/A',
     email: json['email'] as String? ?? 'N/A',
     phone: json['phone'] as String? ?? 'N/A',
     website: json['website'] as String? ?? 'N/A'
     );
  }

 Map<String,dynamic> toJson(){
  return {
    'id': id,
    'name':name,
    'username':username,
    'email':email,
    'phone':phone,
    'website':website
  };
 }
}