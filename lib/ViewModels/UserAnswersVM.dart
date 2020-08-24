import 'package:turksat_survey/ViewModels/SelectedqaVM.dart';

class UserAnswersVM {
  int addressID;
  int userID;
  List<SelectedqaVM> answers = List<SelectedqaVM>();

  UserAnswersVM({this.addressID, this.userID});
}
