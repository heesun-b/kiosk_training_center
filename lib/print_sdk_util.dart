
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/main.dart';

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
  static final DynamicLibrary func = DynamicLibrary.open('C:/Windows/SysWOW64/BXLPAPI_x64.dll');

  static bool openPrint() {
    final printerOpen = func.lookupFunction<PrinterOpenFunc, PrinterOpen>('PrinterOpen');
    String printerName = ''; // Replace with your printer
    int lResult = printerOpen(2, printerName.toNativeUtf8(), 0, 0, 0, 0, 0);

    if (lResult == 0) {
      return true;
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text('lResult: $lResult'),
      ));
      return false;
    }
  }

  static bool printExport(String filePath) {
    final printBitmap = func.lookupFunction<PrintBitmapFunc, PrintBitmap>('PrintBitmap');
    int bResult = printBitmap(filePath.toNativeUtf8(), -1, 1, 30, true);
    if (bResult == 0) {
      return true;
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text("bResult: $bResult"),
      ));
      return false;
    }
  }

  static bool cutPaper() {
    final cutPaper = func.lookupFunction<CutPaperFunc, CutPaper>('CutPaper');
    int cResult = cutPaper();

    if (cResult == 0) {
      return true;
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text("cResult: $cResult"),
      ));
      return false;
    }
  }

  static bool printClose() {
    final printClose = func.lookupFunction<PrinterCloseFunc, PrinterClose>('PrinterClose');
    int pcResult = printClose();

    if (pcResult == 0) {
      return true;
    } else {
      // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      //   content: Text("pcResult: $pcResult"),
      // ));
      return false;
    }
  }

  static bool initializePrinter() {
    final initializePrinter = func.lookupFunction<InitializePrinterFunc, InitializePrinter>('InitializePrinter');
    int iPResult = initializePrinter();
    if (iPResult == 0) {
      return true;
    } else {
      // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      //   content: Text("iPResult: $iPResult"),
      // ));
      return false;
    }
  }
}