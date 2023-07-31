import 'package:get_storage/get_storage.dart';

final getdata = GetStorage();

save(key, value) {
  final data = GetStorage();
  data.write(key, value);
}
