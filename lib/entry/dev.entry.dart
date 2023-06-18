import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../firebase_options_dev.dart';
import '../main.dart' as entry;

FirebaseOptions _firebaseOptions = DefaultFirebaseOptions.currentPlatform;

main() async {
  await dotenv.load(fileName: "assets/.env.dev");

  entry.main("dev", _firebaseOptions);
}
