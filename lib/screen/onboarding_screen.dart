import 'package:flutter/material.dart';
import 'package:flutter_ai/model/onboard.dart';
import 'package:flutter_ai/screen/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you!',
          lottie: 'ai_ask'
          // width: 411.42857142857144,
          // height: 293.8775510205082
          ),
      Onboard(
          title: 'Imagination to Reality',
          subtitle:
              'Just imagine anything & share it with me, I will create something wonderful for you!',
          lottie: 'ai_image'
          // width: 411.42857142857144,
          // height: 293.8775510205082
          )
    ];
    return Scaffold(
        body: PageView.builder(
      controller: c,
      itemCount: list.length,
      itemBuilder: (ctx, ind) {
        final isLast = ind == list.length - 1;
        return Column(
          children: [
            //space
            const Spacer(flex: 2),

            //gif
            Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                // width: list[ind].width, height: list[ind].height
                width: isLast ? mq.width * .7 : null),

            //space
            SizedBox(height: mq.width * .05),

            //title
            Text(
              list[ind].title,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: .5),
            ),

            //space
            SizedBox(height: mq.width * .015),

            //subtitle
            SizedBox(
              width: mq.width * .7,
              child: Text(
                list[ind].subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15, letterSpacing: .5, color: Colors.black45),
              ),
            ),

            //space
            const Spacer(),

            //dots
            Wrap(
              spacing: 10,
              children: List.generate(
                  2,
                  (i) => Container(
                        width: i == ind ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                            color: i == ind ? Colors.blue : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                      )),
            ),

            //space
            const Spacer(),

            //button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(mq.width * .4, 50),
                    textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5)),
                onPressed: () {
                  // Navigate to the next page
                  if (isLast) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  } else {
                    c.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  }
                },
                child: Text(isLast ? 'Home' : 'Next')),

            //space
            const Spacer(flex: 2)
          ],
        );
      },
    ));
  }
}
