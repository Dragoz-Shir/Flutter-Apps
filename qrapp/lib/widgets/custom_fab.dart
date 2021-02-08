import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     "#FF5722", "Cancelar Escaneo", false, ScanMode.QR);

        String barcodeScanRes = "http://www.google.com";
        print(barcodeScanRes);
      },
    );
  }
}
