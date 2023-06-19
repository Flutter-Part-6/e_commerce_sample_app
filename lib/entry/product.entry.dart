import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_app/firebase_options.dart';

import '../main.dart' as entry;

FirebaseOptions _firebaseOptions = DefaultFirebaseOptions.currentPlatform;

main() async {
  await dotenv.load(fileName: "assets/.env");

  entry.main(dotenv.env["FLAVOR"], _firebaseOptions);
}
