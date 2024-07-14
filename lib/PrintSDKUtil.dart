
import 'dart:ffi';
import 'package:ffi/ffi.dart';

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

  static bool openPrint() {
    final printerOpen = func.lookupFunction<PrinterOpenFunc, PrinterOpen>('PrinterOpen');
    // Example call with parameters similar to your C++ example
    String printerName = ''; // Replace with your printer
    int lResult = printerOpen(2, printerName.toNativeUtf8(), 0, 0, 0, 0, 0);
    print("lResult: $lResult");
    if (lResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool printExport() {
    String filePath = "C:/workspace/kiosk_training_center/assets/images/loading.png";
    final printBitmap = func.lookupFunction<PrintBitmapFunc, PrintBitmap>('PrintBitmap');
    int bResult = printBitmap(filePath.toNativeUtf8(), -1, 1, 30, false);
    print("bResult: $bResult");
    if (bResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool cutPaper() {
    final cutPaper = func.lookupFunction<CutPaperFunc, CutPaper>('CutPaper');
    int cResult = cutPaper();
    print("cResult: $cResult");
    if (cResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool printClose() {
    final printClose = func.lookupFunction<PrinterCloseFunc, PrinterClose>('PrinterClose');
    int pcResult = printClose();
    print("pcResult: $pcResult");
    if (pcResult == 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool initializePrinter() {
    final initializePrinter = func.lookupFunction<InitializePrinterFunc, InitializePrinter>('InitializePrinter');
    int iPResult = initializePrinter();
    print("iPResult: $iPResult");
    if (iPResult == 0) {
      return true;
    } else {
      return false;
    }
  }
}