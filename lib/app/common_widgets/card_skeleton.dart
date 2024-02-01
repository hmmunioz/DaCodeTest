import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimer_base;

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Color(0x0f000000),
            offset: Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        bottom: 23.0,
        top: 17.0,
      ),
      width: size.width * .45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Shimmer(
                height: 50.0,
                width: 50.0,
                radius: 17,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 13.0,
                    ),
                    child: Shimmer(
                      width: double.infinity,
                      height: 10,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Shimmer(
                    width: 59,
                    height: 10,
                  ),
                  SizedBox(height: 5.0),
                  Shimmer(
                    width: 93,
                    height: 10,
                  ),
                  SizedBox(height: 17.0),
                  Shimmer(
                    width: 95,
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Shimmer extends StatelessWidget {
  const Shimmer({
    Key? key,
    required this.height,
    this.radius = 8,
    required this.width,
  }) : super(key: key);

  final double? height;
  final double radius;
  final double? width;

  @override
  Widget build(BuildContext context) => shimer_base.Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        direction: shimer_base.ShimmerDirection.ltr,
        highlightColor: Colors.grey[300]!,
        period: const Duration(seconds: 2),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xffdddddd),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      );
}
