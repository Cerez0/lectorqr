import 'package:codigosqr/providers/scan_list_provider.dart';
import 'package:codigosqr/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({ @required this.tipo});

  @override
  Widget build(BuildContext context) {

    final scanListProvider =  Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction){
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            this.tipo == 'http'
              ? Icons.http_rounded
              : Icons.qr_code,

            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].tipo.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: (){
            abrirURL(context, scans[i]);
          },
        ),
      ),
    );
  }
}
