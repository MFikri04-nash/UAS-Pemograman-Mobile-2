import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'pages/login_page.dart';
import 'providers/inventory_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hpwhqlihjgfjtqoagazq.supabase.co',
    anonKey: 'sb_publishable_Y72ypgw_d-DD124eOxnPAQ_zeAj0beS',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Auth Demo',
      home: LoginPage(),
    );
  }
}
