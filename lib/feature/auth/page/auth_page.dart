import 'package:disruptive_ui/disruptive_ui.dart';
import 'package:disruptivestudio_test/feature/auth/widget/sign_in_widget.dart';
import 'package:disruptivestudio_test/feature/auth/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';



class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    color: AppColors.grey1,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.4),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Escoge una opción para ingresar',
              style: UITextStyle.labels.label.copyWith(
                fontSize: 18,
                color: AppColors.grey1,
                fontWeight: FontWeight.w500,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInWidget()),
                    );
                  },
                  child: Text(
                    'Iniciar sesión',
                    style: UITextStyle.labels.label.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
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
                    backgroundColor: AppColors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: AppColors.primary,
                        )),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpWidget()),
                    );
                  },
                  child: Text(
                    'Registrase',
                    style: UITextStyle.labels.label.copyWith(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
