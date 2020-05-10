//import 'dart:async';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:injectable/injectable.dart';
//
//@lazySingleton
//class AlertDialogService {
//  Completer<DialogResponse> _dialogCompleter;
//
//  Future<DialogResponse> showDialog({
//    String title,
//    String description,
//    String buttonTitle = 'Ok',
//  }) {
//    _dialogCompleter = Completer<DialogResponse>();
//
//    Get.dialog(
//        AlertDialog(
//            titleTextStyle: const TextStyle(color: Colors.black),
//            contentTextStyle: const TextStyle(color: Colors.black),
//            title: Text(
//              title,
//              style: TextStyle(
//                fontSize: 16,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//            content: Text(description),
//            actions: <Widget>[
//              FlatButton(
//                child: Text(buttonTitle),
//                onPressed: () {
//                  if (!_dialogCompleter.isCompleted)
//                    completeDialog(DialogResponse(confirmed: true));
//                },
//              ),
//            ]),
//        barrierDismissible: false);
//    return _dialogCompleter.future;
//  }
//
//  void completeDialog(DialogResponse response) {
//    Get.back();
//    _dialogCompleter.complete(response);
//    _dialogCompleter = null;
//  }
//}
//
//class DialogResponse {
//  final bool confirmed;
//
//  final List<String> responseData;
//
//  DialogResponse({
//    this.confirmed,
//    this.responseData,
//  });
//}
