// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) =>
    new User(json['name'] as String);

abstract class _$UserSerializerMixin {
  String get username;
  Map<String, dynamic> toJson() => <String, dynamic>{'name': username};
}
