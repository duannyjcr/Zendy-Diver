import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadData8kt = false;
  FFUploadedFile uploadedLocalFile_uploadData8kt =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData8kt = '';

  // State field(s) for NumberTextField widget.
  FocusNode? numberTextFieldFocusNode;
  TextEditingController? numberTextFieldTextController;
  String? Function(BuildContext, String?)?
      numberTextFieldTextControllerValidator;
  String? _numberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qlf3zfi9' /* Enter your phone number is req... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    numberTextFieldTextControllerValidator =
        _numberTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    numberTextFieldFocusNode?.dispose();
    numberTextFieldTextController?.dispose();
  }
}
