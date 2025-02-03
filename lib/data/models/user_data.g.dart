// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String,
      userName: json['userName'] as String,
      birthDay: json['birthDay'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'userName': instance.userName,
      'birthDay': instance.birthDay,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'language': instance.language,
    };
