class Users {
  int _id;
  String name;
  String _surName;
  String userName = '';
  String password = '';
  String _email;
  String _phoneNumber;

  Users({this.userName, this.password});

  String get getUsername {
    return this.userName;
  }

  String get getPassword {
    return this.password;
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userName: json['userName'],
      password: json['password'],
    );
  }

  //set setUsername(username) => this._userName = username;

  //set setPassword(pwd) => this._password = pwd;
}
