import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../main.dart' as entry;

main() async {
  await dotenv.load(fileName: "assets/.env");
  print(dotenv.env["FLAVOR"]);
  entry.main();
}
