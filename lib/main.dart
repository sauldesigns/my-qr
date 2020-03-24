import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen/screens/home.dart';
import 'package:qr_gen/services/navigation.dart';
import 'package:qr_gen/services/service_locator.dart';

void main() {
  // setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationService>(
          create: (_) => NavigationService(),
        )
      ],
      child: MaterialApp(
        title: 'My QR',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}
