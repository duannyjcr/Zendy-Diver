// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:slide_to_act/slide_to_act.dart';

class SlideToConfirm extends StatefulWidget {
  const SlideToConfirm({
    Key? key,
    this.width,
    this.height,
    required this.action,
    required this.inner,
    required this.outer,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() action;
  final Color inner;
  final Color outer;

  @override
  _SlideToConfirmState createState() => _SlideToConfirmState();
}

class _SlideToConfirmState extends State<SlideToConfirm> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SlideAction(
      borderRadius: 30,
      elevation: 0,
      text: "Desliza para confirmar",
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      innerColor: widget.inner,
      outerColor: widget.outer,
      sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
      submittedIcon: const Icon(Icons.check, color: Colors.white),
      onSubmit: () async {
        await widget.action();
      },
    ));
  }
}
