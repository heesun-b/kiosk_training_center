import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_training_center/main.dart';

// Type definitions for the WinSCard functions and constants.
typedef SCardEstablishContextC = Int32 Function(
    Uint32 dwScope,
    Pointer<Void> pvReserved1,
    Pointer<Void> pvReserved2,
    Pointer<IntPtr> phContext,
    );

typedef SCardEstablishContextDart = int Function(
    int dwScope,
    Pointer<Void> pvReserved1,
    Pointer<Void> pvReserved2,
    Pointer<IntPtr> phContext,
    );

typedef SCardListReadersWC = Int32 Function(
    IntPtr hContext,
    Pointer<Utf16> mszGroups,
    Pointer<Utf16> mszReaders,
    Pointer<Uint32> pcchReaders,
    );

typedef SCardListReadersWDart = int Function(
    int hContext,
    Pointer<Utf16> mszGroups,
    Pointer<Utf16> mszReaders,
    Pointer<Uint32> pcchReaders,
    );

typedef SCardConnectWC = Int32 Function(
    IntPtr hContext,
    Pointer<Utf16> szReader,
    Uint32 dwShareMode,
    Uint32 dwPreferredProtocols,
    Pointer<IntPtr> phCard,
    Pointer<Uint32> pdwActiveProtocol,
    );

typedef SCardConnectWDart = int Function(
    int hContext,
    Pointer<Utf16> szReader,
    int dwShareMode,
    int dwPreferredProtocols,
    Pointer<IntPtr> phCard,
    Pointer<Uint32> pdwActiveProtocol,
    );

typedef SCardStatusWC = Int32 Function(
    IntPtr hCard,
    Pointer<Utf16> mszReaderName,
    Pointer<Uint32> pcchReaderLen,
    Pointer<Uint32> pdwState,
    Pointer<Uint32> pdwProtocol,
    Pointer<Uint8> pbAtr,
    Pointer<Uint32> pcbAtrLen,
    );

typedef SCardStatusWDart = int Function(
    int hCard,
    Pointer<Utf16> mszReaderName,
    Pointer<Uint32> pcchReaderLen,
    Pointer<Uint32> pdwState,
    Pointer<Uint32> pdwProtocol,
    Pointer<Uint8> pbAtr,
    Pointer<Uint32> pcbAtrLen,
    );

// Constants for the scope of the resource manager context.
const SCARD_SCOPE_USER = 0;
const SCARD_SCOPE_TERMINAL = 1;
const SCARD_SCOPE_SYSTEM = 2;

const SCARD_SHARE_SHARED = 2;
const SCARD_PROTOCOL_T0 = 1;
const SCARD_PROTOCOL_T1 = 2;
const SCARD_PROTOCOL_RAW = 4;

const SCARD_STATE_UNAWARE = 0x0000;
const SCARD_STATE_PRESENT = 0x00000020;
const SCARD_STATE_EMPTY = 0x00000010;
const SCARD_STATE_EXCLUSIVE = 0x00000080;
const SCARD_STATE_INUSE = 0x00000100;

const SCARD_S_SUCCESS = 0;

// Function to parse multi-string.
List<String> parseMultiString(Pointer<Uint16> multiString) {
  final strings = <String>[];
  var offset = 0;

  while (true) {
    final str = multiString.elementAt(offset).cast<Utf16>().toDartString();
    if (str.isEmpty) break;
    strings.add(str);
    offset += str.length + 1; // Move past the current string and the null terminator.
  }

  return strings;
}

bool init() {
  // Load the WinSCard DLL
  final winSCard = DynamicLibrary.open('C:/Windows/system32/winscard.dll'); // Updated DLL name

  // Look up the SCardEstablishContext function
  final SCardEstablishContextDart SCardEstablishContext = winSCard.lookupFunction<SCardEstablishContextC, SCardEstablishContextDart>('SCardEstablishContext');

  // Look up the SCardListReadersW function
  final SCardListReadersWDart SCardListReadersW = winSCard.lookupFunction<SCardListReadersWC, SCardListReadersWDart>('SCardListReadersW');

  // Look up the SCardConnectW function
  final SCardConnectWDart SCardConnectW = winSCard.lookupFunction<SCardConnectWC, SCardConnectWDart>('SCardConnectW');

  // Look up the SCardStatusW function
  final SCardStatusWDart SCardStatusW = winSCard.lookupFunction<SCardStatusWC, SCardStatusWDart>('SCardStatusW');

  // Establish the context
  final phContext = calloc<IntPtr>();
  final result = SCardEstablishContext(SCARD_SCOPE_SYSTEM, nullptr, nullptr, phContext);

  if (result == SCARD_S_SUCCESS) {
    // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    //   content: Text('SCardEstablishContext succeeded, context: ${phContext.value}')
    // ));

    // Get the list of readers
    final pcchReaders = calloc<Uint32>();
    SCardListReadersW(phContext.value, nullptr, nullptr, pcchReaders);
    final readerCount = pcchReaders.value;
    if (readerCount > 0) {
      final mszReaders = calloc<Uint16>(readerCount);
      final resultListReaders = SCardListReadersW(phContext.value, nullptr, mszReaders.cast<Utf16>(), pcchReaders);
      if (resultListReaders == SCARD_S_SUCCESS) {
        final readerList = parseMultiString(mszReaders);

        // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        //   content: Text('Readers: $readerList')
        // ));

        // Select the first reader for connection (change as needed)
        final readerName = readerList.isNotEmpty ? readerList.first : null;

        if (readerName != null) {
          // Connect to the card
          final phCard = calloc<IntPtr>();
          final pdwActiveProtocol = calloc<Uint32>();
          final connectResult = SCardConnectW(
            phContext.value,
            readerName.toNativeUtf16(), // Convert Dart string to UTF-16
            SCARD_SHARE_SHARED,
            SCARD_PROTOCOL_T0 | SCARD_PROTOCOL_T1,
            phCard,
            pdwActiveProtocol,
          );

          if (connectResult == SCARD_S_SUCCESS) {

            // Check card state
            final pdwState = calloc<Uint32>();
            final pdwProtocol = calloc<Uint32>();
            final pcbAtrLen = calloc<Uint32>();
            final statusResult = SCardStatusW(
              phCard.value,
              nullptr,
              nullptr,
              pdwState,
              pdwProtocol,
              nullptr,
              pcbAtrLen,
            );

            if (statusResult == SCARD_S_SUCCESS) {
              final cardState = pdwState.value;

              if (cardState & SCARD_STATE_PRESENT != 0) {
                print('Card is present.');
              } else if (cardState & SCARD_STATE_EMPTY != 0) {
                print('Card slot is empty.');
              } else {
                print('Card state unknown.');
              }
            } else {
              print('Failed to get card status, error code: $statusResult');
            }

            calloc.free(pcbAtrLen);
            calloc.free(pdwProtocol);
            calloc.free(pdwState);
            calloc.free(pdwActiveProtocol);
            calloc.free(phCard);
            calloc.free(phContext);
            return true;
          } else {
            // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
            //   content: Text('SCardConnectW failed, error code: $connectResult')
            // ));
          }
        } else {
          // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
          //   content: Text('No readers available to connect.')
          // ));
        }

        calloc.free(mszReaders);
      } else {
        // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        //   content: Text('SCardListReadersW failed, error code: $resultListReaders')
        // ));
      }
      calloc.free(pcchReaders);
    } else {
      // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      //   content: Text('No readers available to connect.')
      // ));
    }
  } else {
    // scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    //     content: Text('SCardEstablishContext failed, error code: $result')
    // ));
  }

  // Free allocated memory
  calloc.free(phContext);
  return false;
}
