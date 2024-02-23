class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  int? phone;
  String? address1;
  String? address2;
  String? province;
  String? city;
  int? postCode;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.firstname,
      this.lastname,
      this.phone,
      this.address1,
      this.address2,
      this.province,
      this.city,
      this.postCode,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    address1 = json['address1'];
    address2 = json['address2'];
    province = json['province'];
    city = json['city'];
    postCode = json['post_code'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['province'] = this.province;
    data['city'] = this.city;
    data['post_code'] = this.postCode;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
