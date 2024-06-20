import 'package:flutter/material.dart';
import 'package:disruptive_ui/disruptive_ui.dart';

class AppProductCard extends StatelessWidget {
  const AppProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.subTitle,
    required this.subPrice,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String price;
  final String subPrice;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.gray50),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray100.withOpacity(.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      child: CustomImage(
                        image: image,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 36),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.blackText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.ibmPlexSansRegular,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 52),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: AppColors.grayMarca,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.ibmPlexSansRegular,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$$subPrice MXN",
                    style: const TextStyle(
                      color: AppColors.lyricsBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.ibmPlexSansRegular,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.lyricsBlack,
                    ),
                  ),
                  Text(
                    "\$$price MXN",
                    style: const TextStyle(
                      color: AppColors.blackText,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.ibmPlexSansBold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 30,
                    width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.orangeSelector,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      '2x1',
                      style: UITextStyle.titles.title1Light.copyWith(
                        color: AppColors.orangeSelector,
                        fontSize: 14,
                      ),
                    )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 36),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.greenBorder,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        )),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: 60,
                height: 60,
                color: AppColors.orangeSelector, // Color del triángulo
                child: Center(
                  child: Transform.rotate(
                    angle: -3.14 / 4,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        'Oferta',
                        style: TextStyle(
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
