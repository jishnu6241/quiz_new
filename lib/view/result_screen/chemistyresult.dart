import 'package:flutter/material.dart';
import 'package:quiz_new/utils/chemistry_db.dart';
import 'package:quiz_new/utils/color_constant.dart';
import 'package:quiz_new/view/home_page/home_page.dart';

class CheResult extends StatefulWidget {
  final int rightAnswer;
  final int skipCount;

  const CheResult(
      {super.key, required this.rightAnswer, required this.skipCount});

  @override
  State<CheResult> createState() => _CheResultState();
}

class _CheResultState extends State<CheResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundblack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Congrats!',
            style:
                TextStyle(color: ColorConstant.backgroundwhite, fontSize: 25),
          )),
          Text(
            '  ${(widget.rightAnswer / ChemistryDb.chemistrydbquestions.length) * 100}%  Score',
            style: TextStyle(
                color: ColorConstant.mycustomgreen,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstant.mycustomgrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                      'Total Question :  ${ChemistryDb.chemistrydbquestions.length}',
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite, fontSize: 20)),
                  Text('Right:  ${widget.rightAnswer}',
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite, fontSize: 20)),
                  Text(
                      'Wrong:  ${ChemistryDb.chemistrydbquestions.length - widget.rightAnswer - widget.skipCount}',
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite, fontSize: 20)),
                  Text('skipped:  ${widget.skipCount}',
                      style: TextStyle(
                          color: ColorConstant.backgroundwhite, fontSize: 20))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            },
            child: Container(
              height: 50,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: ColorConstant.mycustomgrey),
                color: ColorConstant.mycustomblue,
              ),
              child: Center(
                  child: Text(
                'Restart',
                style: TextStyle(color: ColorConstant.backgroundwhite),
              )),
            ),
          )
        ],
      ),
    );
  }
}
