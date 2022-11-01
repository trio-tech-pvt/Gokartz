class AppUser {
  String? id;
  String? email;
  String? password;
  String? weight;
  String? height;
  String? name;
  String? imageUrl;
  String? fcmToken;

  AppUser({
    this.id,
    this.email,
    this.password,
    this.weight,
    this.imageUrl,
    this.height,
    this.name,
    this.fcmToken,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['weight'] = weight;
    data['height'] = height;
    data['fcmToken'] = fcmToken;

    return data;
  }

  AppUser.fromJson(json, id) {
    this.id = id;
    email = json['email'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    weight = json['weight'];
    height = json['height'];
    fcmToken = json['fcmToken'];
  }
}
