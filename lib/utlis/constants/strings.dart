//Firebase

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

FirebaseAuth authInstance = FirebaseAuth.instance;


//otp
String? fetchedVerificationId = '';
String? smsCode = '';

