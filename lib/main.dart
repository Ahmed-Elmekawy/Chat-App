import 'package:chat_app/features/chat/presentition/views/chat_view.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/onboarding/presentition/views/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          ChatView.id:(context) => const ChatView(),
        },
          debugShowCheckedModeBanner: false,
          home: const OnBoarding()
    );
  }
}

