import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENVIRONMENT {
  static String get BASE_URL => dotenv.env['BASE_URL']!;
}
