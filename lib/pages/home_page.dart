import 'package:codigosqr/pages/direcciones_page.dart';
import 'package:codigosqr/pages/mapas_page.dart';

import 'package:codigosqr/providers/db_provider.dart';
import 'package:codigosqr/providers/scan_list_provider.dart';
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
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              icon: Icon( Icons.delete_forever ),
              onPressed: (){

                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();

              }
          )
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

  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch( currentIndex ) {

      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }


  }
}