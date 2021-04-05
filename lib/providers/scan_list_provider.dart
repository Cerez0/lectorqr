import 'package:codigosqr/models/scan_model.dart';
import 'package:codigosqr/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScanListProvider extends ChangeNotifier {

  List <ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan( String valor ) async {

    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo;
    nuevoScan.id;

    if ( this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;

  }

  cargarScans () async {
    
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo( String tipo ) async {

    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();

  }

  borrarTodos() async {

    await DBProvider.db.borrarTodosLosScan();
    this.scans = [];
    notifyListeners();

  }

  borrarScanPorId(int id) async {

    await DBProvider.db.borrarScan(id);
    this.cargarScanPorTipo(this.tipoSeleccionado);
  }

}