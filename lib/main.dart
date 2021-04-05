import 'package:codigosqr/pages/home_page.dart';
import 'package:codigosqr/pages/map_page.dart';
import 'package:codigosqr/providers/scan_list_provider.dart';
import 'package:codigosqr/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          'home'  : (_) => HomePage(),
          'mapa'  : (_) => Mapa()
        },

        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          )
        ),
      ),
    );
  }
}