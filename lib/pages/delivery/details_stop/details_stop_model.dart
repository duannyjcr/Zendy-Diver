import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'details_stop_widget.dart' show DetailsStopWidget;
import 'package:flutter/material.dart';

class DetailsStopModel extends FlutterFlowModel<DetailsStopWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;
  String? _userNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd9i73s93' /* receiver_name is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for PhonenumberTextField widget.
  FocusNode? phonenumberTextFieldFocusNode;
  TextEditingController? phonenumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      phonenumberTextFieldTextControllerValidator;
  String? _phonenumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kneqbhv3' /* receiver_phonenumber is requir... */,
      );
    }

    return null;
  }

  // State field(s) for TagTextField widget.
  FocusNode? tagTextFieldFocusNode;
  TextEditingController? tagTextFieldTextController;
  String? Function(BuildContext, String?)? tagTextFieldTextControllerValidator;
  String? _tagTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xlc036z0' /* produc_tag is required */,
      );
    }

    return null;
  }

  // State field(s) for CommentTextField widget.
  FocusNode? commentTextFieldFocusNode;
  TextEditingController? commentTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentTextFieldTextControllerValidator;
  // State field(s) for AptTextField widget.
  FocusNode? aptTextFieldFocusNode;
  TextEditingController? aptTextFieldTextController;
  String? Function(BuildContext, String?)? aptTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userNameTextFieldTextControllerValidator =
        _userNameTextFieldTextControllerValidator;
    phonenumberTextFieldTextControllerValidator =
        _phonenumberTextFieldTextControllerValidator;
    tagTextFieldTextControllerValidator = _tagTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    phonenumberTextFieldFocusNode?.dispose();
    phonenumberTextFieldTextController?.dispose();

    tagTextFieldFocusNode?.dispose();
    tagTextFieldTextController?.dispose();

    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();

    aptTextFieldFocusNode?.dispose();
    aptTextFieldTextController?.dispose();
  }

  /// Action blocks.
  Future centermap(
    BuildContext context, {
    LatLng? center,
  }) async {
    await launchMap(
      location: center,
      title: '',
    );
  }
}
