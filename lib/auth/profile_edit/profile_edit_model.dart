import '/flutter_flow/flutter_flow_util.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:flutter/material.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NomeComleto widget.
  FocusNode? nomeComletoFocusNode;
  TextEditingController? nomeComletoController;
  String? Function(BuildContext, String?)? nomeComletoControllerValidator;
  String? _nomeComletoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^((\\b[A-zÀ-ú\']{2,40}\\b)\\s*){2,}\$').hasMatch(val)) {
      return 'Insira seu nome completo.';
    }
    return null;
  }

  // State field(s) for Celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularController;
  String? Function(BuildContext, String?)? celularControllerValidator;
  String? _celularControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(
            '^\\(?(?:[14689][1-9]|2[12478]|3[1234578]|5[1345]|7[134579])\\)? ?(?:[2-8]|9[0-9])[0-9]{3}\\-?[0-9]{4}\$')
        .hasMatch(val)) {
      return 'Numéro de celular inválido';
    }
    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nomeComletoControllerValidator = _nomeComletoControllerValidator;
    celularControllerValidator = _celularControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
  }

  @override
  void dispose() {
    nomeComletoFocusNode?.dispose();
    nomeComletoController?.dispose();

    celularFocusNode?.dispose();
    celularController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
