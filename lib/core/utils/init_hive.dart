import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:local_storage_demo/data/models/user_data.dart';

Future<void> initHive() async {
  // initialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox<UserData>("user_data");
}
