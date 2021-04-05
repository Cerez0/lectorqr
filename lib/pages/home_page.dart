import 'package:codigosqr/pages/direcciones_page.dart';
import 'package:codigosqr/pages/mapas_page.dart';
import 'package:codigosqr/providers/db_provider.dart';
import 'package:codigosqr/providers/ui_provider.dart';
import 'package:codigosqr/widgets/custom_button_scan.dart';
import 'package:codigosqr/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: CustomButtonScan(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  int num = 5;

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO: Temporal leer la base de datos
    final tempScan = new ScanModel(valor: 'http://www.google.com');
    //DBProvider.db.nuevoScan(tempScan);
    DBProvider.db.getScanById(2).then((scan) => print(scan.valor));

    switch (currentIndex) {
      case 0:
        return MapasPage();

      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
