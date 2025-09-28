import '/flutter_flow/flutter_flow_util.dart';
import 'update_address_modal_widget.dart' show UpdateAddressModalWidget;
import 'package:flutter/material.dart';

class UpdateAddressModalModel
    extends FlutterFlowModel<UpdateAddressModalWidget> {
  ///  State fields for stateful widgets in this component.

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
        'svdzl540' /* receiver_name is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for PhonenumberTextField widget.
  FocusNode? phonenumberTextFieldFocusNode;
  TextEditingController? phonenumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      phonenumberTextFieldTextControllerValidator;
  String? _phonenumberTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uz40jzqg' /* receiver_phonenumber is requir... */,
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
        '97epvwaq' /* produc_tag is required */,
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

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    phonenumberTextFieldFocusNode?.dispose();
    phonenumberTextFieldTextController?.dispose();

    tagTextFieldFocusNode?.dispose();
    tagTextFieldTextController?.dispose();

    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();

    aptTextFieldFocusNode?.dispose();
    aptTextFieldTextController?.dispose();
  }
}
