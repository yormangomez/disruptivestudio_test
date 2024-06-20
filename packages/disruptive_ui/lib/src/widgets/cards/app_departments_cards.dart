import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class CustomDepartmentsCardsDer extends StatelessWidget {
  const CustomDepartmentsCardsDer({
    super.key,
    this.height,
    required this.text,
    required this.image,
    required this.onTap,
  });
  final String text;
  final String image;
  final void Function() onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: height ?? 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: text),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Image.asset(
                        image,
                        package: 'lacomer_ui',
                        width: 88,
                        height: 88,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class CustomDepartmentsCardsIzq extends StatelessWidget {
  const CustomDepartmentsCardsIzq({
    super.key,
    this.height,
    required this.text,
    required this.image,
    required this.onTap,
  });
  final String text;
  final String image;
  final void Function() onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
              height: height ?? 156,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: text),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Image.asset(
                          image,
                          package: 'lacomer_ui',
                          width: 88,
                          height: 88,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
