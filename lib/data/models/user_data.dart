import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  final String name;
  final String userName;
  final String birthDay;
  final String phoneNumber;
  final String email;
  final String? language;

  UserData({
    required this.name,
    required this.userName,
    required this.birthDay,
    required this.phoneNumber,
    required this.email,
    this.language,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
