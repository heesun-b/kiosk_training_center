
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PrinterOpenFunc = Int64 Function(Int32, Pointer<Utf8>, Int32, Int32, Int32, Int32, Int32);
typedef PrinterOpen = int Function(int, Pointer<Utf8>, int, int, int, int, int);

typedef PrintBitmapFunc = Int64 Function(Pointer<Utf8>, Int64, Int64, Int64, Bool);
typedef PrintBitmap = int Function(Pointer<Utf8>, int, int, int, bool);

typedef CutPaperFunc = Int64 Function();
typedef CutPaper = int Function();

typedef PrinterCloseFunc = Int64 Function();
typedef PrinterClose = int Function();

typedef InitializePrinterFunc = Int64 Function();
typedef InitializePrinter = int Function();

class PrintSDKUtil {
  static final DynamicLibrary func = DynamicLibrary.open('assets/lib/BXLPAPI_x64.dll');

  static bool openPrint(BuildContext context) {
    final printerOpen = func.lookupFunction<PrinterOpenFunc, PrinterOpen>('PrinterOpen');
    // Example call with parameters similar to your C++ example
    String printerName = ''; // Replace with your printer
    int lResult = printerOpen(2, printerName.toNativeUtf8(), 0, 0, 0, 0, 0);
    // windows snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('lResult: $lResult'),
    ));
    if (lResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool printExport(String filePath, BuildContext context) {
    final printBitmap = func.lookupFunction<PrintBitmapFunc, PrintBitmap>('PrintBitmap');
    int bResult = printBitmap(filePath.toNativeUtf8(), -1, 1, 30, false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("bResult: $bResult"),
    ));
    if (bResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool cutPaper(BuildContext context) {
    final cutPaper = func.lookupFunction<CutPaperFunc, CutPaper>('CutPaper');
    int cResult = cutPaper();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("cResult: $cResult"),
    ));
    if (cResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool printClose(BuildContext context) {
    final printClose = func.lookupFunction<PrinterCloseFunc, PrinterClose>('PrinterClose');
    int pcResult = printClose();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("pcResult: $pcResult"),
    ));
    if (pcResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool initializePrinter(BuildContext context) {
    final initializePrinter = func.lookupFunction<InitializePrinterFunc, InitializePrinter>('InitializePrinter');
    int iPResult = initializePrinter();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("iPResult: $iPResult"),
    ));
    if (iPResult == 0) {
      return true;
    } else {
      return false;
    }
  }
}