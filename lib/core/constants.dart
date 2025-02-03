import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:local_storage_demo/data/models/user_data.dart';

final userDataBox = Hive.box<UserData>("user_data");
