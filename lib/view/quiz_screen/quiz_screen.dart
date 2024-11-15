import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app_july/dummy_db.dart';
import 'package:quiz_app_july/utils/color_constants.dart';
import 'package:quiz_app_july/view/results_screen/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  int? selectedAnsIndex;
  int rightAnsCount = 0;
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
                child: Text(DummyDb.questions[currentQuestionIndex]["question"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorConstants.lightGreen,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                4,
                (optionIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () {
                      if (selectedAnsIndex == null) {
                        selectedAnsIndex = optionIndex;
                        if (selectedAnsIndex ==
                            DummyDb.questions[currentQuestionIndex]
                                ["answerIndex"]) {
                          rightAnsCount++;
                          log("right ans count = $rightAnsCount");
                        }
                        setState(() {});
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: getColor(optionIndex)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                DummyDb.questions[currentQuestionIndex]
                                    ["options"][optionIndex],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: ColorConstants.lightGreen,
                                )),
                          ),
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
            ),
            if (selectedAnsIndex != null)
              InkWell(
                onTap: () {
                  if (currentQuestionIndex < DummyDb.questions.length - 1) {
                    currentQuestionIndex++;
                    selectedAnsIndex = null;
                    setState(() {});
                  } else {
                    // navigate to results screen
                    print("results screen");

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(
                            rightAnsCount: rightAnsCount,
                          ),
                        ));
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.warmBrown,
                  ),
                  alignment: Alignment.center,
                  child: Text("Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: ColorConstants.darkBlue,
                      )),
                ),
              ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

// to set color for option seciton based on selected answer
  Color getColor(int optionIndex) {
    // to check whether an answer is selected or not
    if (selectedAnsIndex != null) {
      //to check whether the option is right or not
      if (DummyDb.questions[currentQuestionIndex]["answerIndex"] ==
          optionIndex) {
        return Colors.green;
      }
    }

//to check whether to the selected ansewer is equal to builder index
    if (selectedAnsIndex == optionIndex) {
      //to check whether the  selected answer is right or not
      if (selectedAnsIndex ==
          DummyDb.questions[currentQuestionIndex]["answerIndex"]) {
        // if answer is right (green color)
        return Colors.green;
      } else {
        // if answer is wrong (red color)
        return ColorConstants.red;
      }
    } else {
      // default return  blue colors
      return ColorConstants.darkBlue;
    }
  }
}
