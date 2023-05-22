import 'package:flutter/material.dart';
import 'package:zr/helpers/colors.dart';
import 'package:zr/helpers/dimensions.dart';
import 'package:zr/screens/onboarding/screen3.dart';
import 'package:zr/widgets/skip_button.dart';

class ScreenTwo extends StatelessWidget {
  static var routeName = 'screen2';
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: Dimensions.getHeight(context) * 0.65,
                width: width,
                child: Image.asset(
                  'assets/four.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 60,
                right: 20,
                child: SkipButton(),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Unable to manage Time?',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'You want to learn something new but are not consistent or unable to make a propper plan?',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width - 50,
        height: 80,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.grey,
                  size: 15,
                ),
                Icon(
                  Icons.circle,
                  color: CustomTheme.theme,
                  size: 15,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, ScreenThree.routeName),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: CustomTheme.theme,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
