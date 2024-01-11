import 'package:hive_flutter/adapters.dart';
part 'local_github.g.dart';

@HiveType(typeId: 1)
class LocalGithub {
  @HiveField(0)
  String? login;
  @HiveField(1)
  String? avatarUrl;
  @HiveField(2)
  DateTime? dateTime;

  LocalGithub({
    required this.login,
    required this.avatarUrl,
    this.dateTime,
  });

  // ...

  factory LocalGithub.fromJson(Map<String, dynamic> json) {
    return LocalGithub(
      login: json["login"],
      avatarUrl: json["avatar_url"],
      dateTime:DateTime.now(),
    );
  }
}
