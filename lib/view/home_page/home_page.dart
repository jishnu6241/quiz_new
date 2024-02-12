import 'package:flutter/material.dart';
import 'package:quiz_new/model/option_db/option_db.dart';
import 'package:quiz_new/view/question_page/biology_question.dart';

import 'package:quiz_new/view/question_page/chemiste_question_page.dart';
import 'package:quiz_new/view/question_page/giography_question.dart';
import 'package:quiz_new/view/question_page/history_questio.dart';
import 'package:quiz_new/view/question_page/maths_question.dart';
import 'package:quiz_new/view/question_page/sports_question_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title: Text(
                  'Hi, John',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                subtitle: Text(
                  'lets make the day producutive',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Choose a category',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 20),
                child: Text('Lets Play',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => index == 0
                                    ? SportsQns(context)
                                    : index == 1
                                        ? ChemQns(context)
                                        : index == 2
                                            ? MathsQns(context)
                                            : index == 3
                                                ? HisQns(context)
                                                : index == 4
                                                    ? BioQns(context)
                                                    : GeoQns(context)));
                      },
                      child: Card(
                        color: Colors.grey[900],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: NetworkImage(
                                      OptionDb.data[index]['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                              Text(OptionDb.data[index]['text1'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Text(OptionDb.data[index]['text2'],
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
