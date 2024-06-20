// ignore_for_file: use_build_context_synchronously, unused_element

import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:disruptivestudio_test/core/database/database_helper.dart';
import 'package:disruptivestudio_test/feature/auth/widget/sign_up_widget.dart';
import 'package:disruptivestudio_test/feature/home/page/home_page.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  String email = '';
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  final RegExp passwordRegExp = RegExp('[A-Z]');
  final RegExp passwordMayu = RegExp('[A-Za-z]');
  final RegExp passwordNum = RegExp('[0-9]');
  final RegExp specialCharacters = RegExp(r'[^a-zA-Z\d]');
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  void _login() async {
    if (formKey.currentState!.validate()) {
      var user = await DatabaseHelper().authenticateUser(
        controllerEmail.text,
        controllerPassword.text,
      );
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de sesión exitoso')),
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.grey1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child: Center(
                  child: Text(
                    'Te damos la bienvenida',
                    textAlign: TextAlign.center,
                    style: UITextStyle.labels.label.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey1,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    } else if (!emailRegex.hasMatch(value)) {
                      return "Introduzca un correo válido.";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppColors.grey1),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    hintText: 'Correo electrónico',
                    hintStyle: UITextStyle.labels.label.copyWith(
                      color: AppColors.grey1,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.grey1,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.grey1,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    errorStyle: const TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  obscureText: !isVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }

                    return null;
                  },
                  controller: controllerPassword,
                  style: const TextStyle(color: AppColors.grey1),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: !isVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: AppColors.grey1,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: AppColors.grey1,
                            ),
                    ),
                    hintText: 'Contraseña',
                    hintStyle: UITextStyle.labels.label.copyWith(
                      color: AppColors.grey1,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.grey1,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.grey1,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    errorStyle: const TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        disabledBackgroundColor: const Color(0xFFD6D6D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: email.length >= 4
                          ? () {
                              if (formKey.currentState!.validate()) {
                                _login();
                              }
                            }
                          : null,
                      child: Text(
                        'Entrar',
                        style: UITextStyle.labels.label.copyWith(
                            color: email.length >= 4
                                ? const Color(0XFFFFFFFF)
                                : const Color(0XFF858585),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpWidget()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: '¿No tienes una cuenta? ',
                          style: UITextStyle.labels.label.copyWith(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        TextSpan(
                          text: ' Regístrate.',
                          style: UITextStyle.labels.label.copyWith(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
