import 'package:flutter/material.dart';
import 'package:track_app/screens/add_track_screen.dart';
import 'package:track_app/screens/home_screen.dart';
import 'package:track_app/screens/track_detail_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://rhvsnecilpodeziqmkrg.supabase.co',
    publishableKey: 'sb_publishable_JVgbj4c0tXlMB5hqB9VUtQ_oGT3xwZq',
  );
  runApp(const App());
}

/// Root of the app, with the route table.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracks',
      theme: ThemeData(colorSchemeSeed: const Color(0xFF6750A4)),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/track': (context) => const TrackDetailScreen(),
        '/add-track': (context) => AddTrackScreen(),
      },
    );
  }
}
