import 'package:flutter/material.dart';
import 'package:quiz_app_july/dummy_db.dart';
import 'package:quiz_app_july/utils/color_constants.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.offWhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.offWhite,
        actions: [Text("1/10")],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.darkBlue,
                    borderRadius: BorderRadius.circular(15)),
                height: 100,
                alignment: Alignment.center,
                child: Text(DummyDb.questions[0]["question"],
                    style: TextStyle(
                      color: ColorConstants.lightGreen,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConstants.darkBlue,
                        border: Border.all(color: ColorConstants.darkBlue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("option",
                            style: TextStyle(
                              color: ColorConstants.lightGreen,
                            )),
                        Icon(
                          Icons.circle_outlined,
                          color: ColorConstants.lightGreen,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.warmBrown,
              ),
              alignment: Alignment.center,
              child: Text(
                "Next",
                style: TextStyle(
                    color: ColorConstants.darkBlue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
