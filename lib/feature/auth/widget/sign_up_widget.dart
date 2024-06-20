// ignore_for_file: use_build_context_synchronously

import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:disruptivestudio_test/core/database/database_helper.dart';
import 'package:disruptivestudio_test/feature/home/page/home_page.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController controllerAccesskey = TextEditingController();
  final TextEditingController controllerNewPassword = TextEditingController();
  final TextEditingController controllerCurrentPassword =
      TextEditingController();

  bool isVisibleOne = false;
  bool isVisibleTwo = false;

  String accesskey = '';
  String password = '';
  String newPassword = '';
  final formKey = GlobalKey<FormState>();

  bool isMini = false;

  bool validacionContrasenas(String newPasswordForm, String passwordForm) {
    bool condicion4 = newPasswordForm == passwordForm;

    return condicion4;
  }

  bool validarCampos(
      String accessKeyForm, String newPasswordForm, String passwordForm) {
    // Verificar todas las condiciones
    bool condicion1 = accessKeyForm.isNotEmpty;
    bool condicion2 = newPasswordForm.isNotEmpty;
    bool condicion3 = passwordForm.isNotEmpty;
    bool condicion4 = newPasswordForm == passwordForm;

    // Devolver true si todas las condiciones se cumplen, de lo contrario devolver false
    return condicion1 && condicion2 && condicion3 && condicion4;
  }

  void _register() async {
    if (formKey.currentState!.validate()) {
      var result = await DatabaseHelper().registerUser(
        controllerAccesskey.text,
        controllerNewPassword.text,
      );
      if (result != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso')),
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar el usuario')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52),
                child: Center(
                  child: Text(
                    'Bienvenidos',
                    textAlign: TextAlign.center,
                    style: UITextStyle.labels.label.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Validar correo electrónico y crear una nueva contraseña',
                textAlign: TextAlign.center,
                style: UITextStyle.labels.label.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey1,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: controllerAccesskey,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      accesskey = value;

                      formKey.currentState!.validate();
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo requerido";
                    }

                    return null;
                  },
                  style: const TextStyle(color: AppColors.grey1),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    hintText: 'Correo electrónico',
                    hintStyle: UITextStyle.labels.label.copyWith(
                      color: AppColors.grey1,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
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
                    errorBorder: const OutlineInputBorder(
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
                  controller: controllerNewPassword,
                  obscureText: !isVisibleOne,
                  onChanged: (value) {
                    setState(() {
                      isMini = value.length >= 8;

                      password = value;

                      formKey.currentState!.validate();
                    });
                  },
                  validator: (value) {
                    if (password.isEmpty) {
                      return "Campo requerido";
                    }
                    if (!validacionContrasenas(password, newPassword)) {
                      return "Las contraseñas deben de coincidir.";
                    }

                    return null;
                  },
                  style: const TextStyle(color: AppColors.grey1),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibleOne = !isVisibleOne;
                          });
                        },
                        icon: !isVisibleOne
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintText: 'Ingresar su contraseña',
                    hintStyle: UITextStyle.labels.label.copyWith(
                      color: AppColors.grey1,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
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
                    errorBorder: const OutlineInputBorder(
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
                  controller: controllerCurrentPassword,
                  obscureText: !isVisibleTwo,
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;

                      formKey.currentState!.validate();
                    });
                  },
                  validator: (value) {
                    if (newPassword.isEmpty) {
                      return "Campo requerido";
                    }
                    if (!validacionContrasenas(password, newPassword)) {
                      return "Las contraseñas deben de coincidir.";
                    }

                    return null;
                  },
                  style: const TextStyle(color: AppColors.grey1),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibleTwo = !isVisibleTwo;
                          });
                        },
                        icon: !isVisibleTwo
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintText: 'Confirmar contraseña',
                    hintStyle: UITextStyle.labels.label.copyWith(
                      color: AppColors.grey1,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
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
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    errorStyle: const TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                      onPressed:
                          !validarCampos(accesskey, newPassword, password)
                              ? null
                              : () {
                                  _register();
                                },
                      child: Text(
                        'Crear',
                        style: UITextStyle.labels.label.copyWith(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
