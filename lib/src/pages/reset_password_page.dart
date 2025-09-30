import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/responsive_app.dart';
import '../utils/slide_transition.dart';

import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/reset_password_widgets/reset_password_header.dart';

import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {

  const ResetPasswordPage( { super.key } );

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();

}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final controllerCode = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool bCodeError = false;
  bool bPassError = false;
  bool bConfPassError = false;

  @override
  Widget build( BuildContext context ) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const ResetPasswordHeader(),
                SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
                TextFieldForms(
                  controller: controllerCode,
                  sLabel: 'Código de seguridad',
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState( () => bCodeError = true );
                      return 'Por favor ingresa un valor';
                    }
                    return null;
                  },
                  bError: bCodeError
                ),
                SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
                TextFieldForms(
                  controller: controllerPassword,
                  sLabel: 'Contraseña',
                  bIsPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState( () => bPassError = true );
                      return 'Por favor ingresa un valor';
                    }
                    return null;
                  },
                  bError: bPassError
                ),
                SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
                TextFieldForms(
                  controller: controllerConfirmPassword,
                  sLabel: 'Confirmar contraseña',
                  bIsPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      setState( () => bConfPassError = true );
                      return 'Por favor ingresa un valor';
                    }
                    return null;
                  },
                  bError: bConfPassError
                ),
                SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
                MainButton(
                  sLabel: 'Restablecer contraseña',
                  onPressed: () {
                    if( _formKey.currentState!.validate() ) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        SlidePageRoute( page: const LoginPage() ),
                        (route) => false
                      );
                    }
                  }
                )
              ]
            )
          )
        )
      )
    );

  }
}