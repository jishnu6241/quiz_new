import 'package:flutter/material.dart';
import 'package:quiz_new/model/custom_progress_bar/custom_progress_bar.dart';
import 'package:quiz_new/utils/biology_db.dart';
import 'package:quiz_new/utils/color_constant.dart';
import 'package:quiz_new/view/result_screen/bioresult.dart';

class BioQns extends StatefulWidget {
  const BioQns(BuildContext context, {super.key});

  @override
  State<BioQns> createState() => _BioQnsState();
}

class _BioQnsState extends State<BioQns> {
  late double persantage = 0.0;
  int questinindex = 0;
  int? selectedAnswerIndex;
  int righAnswer = 0;
  int skipCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff1c1c1c),
          leading: const SizedBox(),
          title: CustomProgressBar(
            height: 20,
            width: 200,
            progress: persantage,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${questinindex + 1}/ ${BiologyDb.biologydbquestions.length}',
                style: TextStyle(color: ColorConstant.mycustomblue),
              ),
            )
          ],
        ),
        backgroundColor: ColorConstant.backgroundblack,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: 370,
                  decoration: BoxDecoration(
                      color: ColorConstant.mycustomgrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      BiologyDb.biologydbquestions[questinindex]["question"],
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: BiologyDb
                      .biologydbquestions[questinindex]["options"].length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedAnswerIndex = index;
                          if (selectedAnswerIndex != null &&
                              selectedAnswerIndex ==
                                  BiologyDb.biologydbquestions[questinindex]
                                      ["answer"]) {
                            righAnswer++;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: getRightAnswer(index)),
                          color: ColorConstant.backgroundblack,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                BiologyDb.biologydbquestions[questinindex]
                                    ["options"][index],
                                style: TextStyle(
                                    color: ColorConstant.backgroundwhite),
                              ),
                            ),
                            CircleAvatar(
                                radius: 9,
                                backgroundColor: getRightAnswer(index),
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: ColorConstant.mycustomgrey,
                                  child: iconshower(index),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (selectedAnswerIndex == null) {
                      skipCount++;
                    }
                    selectedAnswerIndex = null;
                    persantage += 0.1;
                    if (questinindex <
                        BiologyDb.biologydbquestions.length - 1) {
                      questinindex++;

                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BioResult(
                              rightAnswer: righAnswer,
                              skipCount: skipCount,
                            ),
                          ));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2, color: ColorConstant.mycustomgrey),
                      color: ColorConstant.mycustomblue,
                    ),
                    child: Center(
                        child: Text(
                      'Next',
                      style: TextStyle(color: ColorConstant.backgroundwhite),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == BiologyDb.biologydbquestions[questinindex]["answer"]) {
      return ColorConstant.mycustomgreen;
    }
    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          BiologyDb.biologydbquestions[questinindex]["answer"]) {
        return ColorConstant.mycustomgreen;
      } else {
        return ColorConstant.mycustomred;
      }
    } else {
      return ColorConstant.mycustomgrey;
    }
  }

  Widget? iconshower(int index) {
    if (selectedAnswerIndex != null &&
        index == BiologyDb.biologydbquestions[questinindex]["answer"]) {
      return Icon(
        Icons.done,
        size: 10,
        color: ColorConstant.mycustomgreen,
      );
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          BiologyDb.biologydbquestions[questinindex]["answer"]) {
        return const Material();
      } else {
        return Icon(
          Icons.close,
          size: 10,
          color: ColorConstant.mycustomred,
        );
      }
    } else {
      return const Material();
    }
  }
}
