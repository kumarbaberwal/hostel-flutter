// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSignupRequest {
  String userName;
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  num phoneNumber;
  String blockName;
  String roomNumber;
  String userRole;
  DateTime dateTime;
  UserSignupRequest({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
    required this.blockName,
    required this.roomNumber,
    required this.userRole,
    required this.dateTime,
  });
}
