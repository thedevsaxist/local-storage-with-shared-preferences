import 'package:json_annotation/json_annotation.dart';
import 'package:local_storage_demo/barrel.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class UserData {
  @HiveField(0)
  final String name;
  
  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String birthDay;

  @HiveField(3)
  final String phoneNumber;

  @HiveField(4)
  final String email;

  @HiveField(5)
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
