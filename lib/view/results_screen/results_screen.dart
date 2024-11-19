import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app_july/dummy_db.dart';
import 'package:quiz_app_july/utils/color_constants.dart';
import 'package:quiz_app_july/view/quiz_screen/quiz_screen.dart';
import 'package:share_plus/share_plus.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.rightAnsCount});
  final int rightAnsCount;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int starCount = 0;
  @override
  void initState() {
    claculatePercentage();
    super.initState();
  }

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
                  color: starCount > index ? Colors.yellow : Colors.grey,
                  size: index == 1 ? 70 : 40,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
          CachedNetworkImage(
            imageUrl:
                "https://images.pexels.com/photos/27054224/pexels-photo-275424/free-photo-of-motorbike-parked-on-hill-on-sea-coast.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            placeholder: (context, url) =>
                Lottie.asset("assets/animations/popper_animation.json"),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            "Congratulations",
            style: TextStyle(
                color: Colors.amber, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Your Score",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.rightAnsCount}/${DummyDb.questions.length}",
            style: TextStyle(
                color: Colors.amber, fontSize: 30, fontWeight: FontWeight.bold),
          ),

          //restart button
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Share.share(
                      "${widget.rightAnsCount}/${DummyDb.questions.length}");
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstants.warmBrown,
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.share)),
              ),
              SizedBox(
                width: 20,
              ),
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
        ],
      ),
    );
  }

  claculatePercentage() {
    num percentge = (widget.rightAnsCount / DummyDb.questions.length) * 100;
    if (percentge >= 90) {
      starCount = 3;
    } else if (percentge >= 50) {
      starCount = 2;
    } else if (percentge >= 30) {
      starCount = 1;
    }
    setState(() {});
  }
}
