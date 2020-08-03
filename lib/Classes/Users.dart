class Users {
  String _name;
  String _surName;
  String _userName = '';
  String _password = '';

  Users(this._userName, this._password);

  String get getUsername {
    return this._userName;
  }

  String get getPassword {
    return this._password;
  }

  //set setUsername(username) => this._userName = username;

  //set setPassword(pwd) => this._password = pwd;
}
