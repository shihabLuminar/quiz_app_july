import 'package:flutter/material.dart';
import 'package:quiz_app_july/utils/color_constants.dart';
import 'package:quiz_app_july/view/quiz_screen/quiz_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(
                    right: 15, left: 15, bottom: index == 1 ? 30 : 0),
                child: Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: index == 1 ? 70 : 40,
                ),
              ),
            ),
          ),
          //restart button
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(),
                  ));
            },
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.warmBrown,
              ),
              alignment: Alignment.center,
              child: Text("Restart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorConstants.darkBlue,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
