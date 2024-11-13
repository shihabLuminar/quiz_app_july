import 'package:flutter/material.dart';
import 'package:quiz_app_july/dummy_db.dart';
import 'package:quiz_app_july/utils/color_constants.dart';
import 'package:quiz_app_july/view/quiz_screen/results_screen/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  int? selectedAnsIndex;
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
                      selectedAnsIndex = optionIndex;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedAnsIndex == optionIndex
                              ? ColorConstants.red
                              : ColorConstants.darkBlue,
                          border: Border.all(color: ColorConstants.darkBlue)),
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
            InkWell(
              onTap: () {
                if (currentQuestionIndex < DummyDb.questions.length - 1) {
                  currentQuestionIndex++;
                  setState(() {});
                } else {
                  // navigate to results screen
                  print("results screen");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(),
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
}
