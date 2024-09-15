import 'package:flutter/material.dart';

import '../../helper/app_navigator.dart';
import '../../style/app_colors.dart';
import '../../style/app_size.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.title, this.canBack = true});

  final bool canBack;
  final String? title;

  @override
  Size get preferredSize => Size.fromHeight(AppSize.getHeight(180));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(200),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff960D23), Color(0xffFC153B)],
        ),
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(AppSize.getSize(30)),
          bottomStart: Radius.circular(AppSize.getSize(30)),
        ),
      ),
      padding: AppSize.padding(horizontal: 12, bottom: 12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff960D23), Color(0xffFC153B)],
                ),
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(AppSize.getSize(30)),
                  bottomStart: Radius.circular(AppSize.getSize(30)),
                ),
              ),
            ),
          ),
          // Positioned.fill(child: CustomSvg(svg: AppSvg.appbarCircles)),
          Positioned.fill(child: CustomPaint(painter: BorderPainter())),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (canBack)
                        InkWell(
                          onTap: () => AppNavigator.pop(),
                          child: Padding(
                            padding: AppSize.padding(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Column(
                          children: [
                            // CustomSvg(
                            //   // svg: AppSvg.logoAppbar,
                            //   width: AppSize.getWidth(164),
                            //   height: AppSize.getHeight(34),
                            // ),
                            if (title != null) ...[
                              SizedBox(height: AppSize.getHeight(12)),
                              Text(
                                title!,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: AppSize.font(14),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radiusValue = AppSize.getSize(30);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppSize.getSize(2)
      ..color = Colors.white;
    paint.shader = LinearGradient(
      end: Alignment.topCenter,
      stops: const [0.0, 0.4, .75],
      begin: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Colors.white.withOpacity(0.5),
        Colors.transparent,
      ],
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    canvas.drawLine(
      Offset(0, size.height - radiusValue),
      const Offset(0, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - radiusValue),
      Offset(size.width, 0),
      paint,
    );
    paint.shader = null;
    Path bottomBorderPath = Path()
      ..moveTo(0, size.height - radiusValue)
      ..arcToPoint(
        Offset(radiusValue, size.height),
        radius: Radius.circular(radiusValue),
        clockwise: false,
      )
      ..lineTo(size.width - radiusValue, size.height)
      ..arcToPoint(
        Offset(size.width, size.height - radiusValue),
        radius: Radius.circular(radiusValue),
        clockwise: false,
      );
    canvas.drawPath(bottomBorderPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
