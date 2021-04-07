import 'package:flutter/material.dart';
import 'package:travel_experience/screens/tab.dart';
import 'package:travel_experience/theme.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import 'home.dart';

class ListItem {
  bool isSelected = false;
  final String text;
  final String image;

  ListItem({this.text, this.image});
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  List<ListItem> list;
  static const String text = 'text';
  static const String image = 'image';

  @override
  void initState() {
    super.initState();
    populateData();
  }

  void populateData() {
    list = [];
    const List<Map<String, String>> profileList = [
      {text: "Sunbathing", image: "assets/images/sunlight.png"},
      {text: "Swimming", image: "assets/images/swim.png"},
      {text: "Eating", image: "assets/images/eating.png"},
      {text: "Sex", image: "assets/images/sex.png"},
      {text: "Photography", image: "assets/images/photography.png"},
      {text: "Camping", image: "assets/images/camping.png"},
      {text: "Walking", image: "assets/images/walk.png"},
      {text: "Surfing", image: "assets/images/surf.png"},
    ];
    for (int i = 0; i < profileList.length; i++)
      list.add(ListItem(
          text: "${profileList[i][text]}", image: "${profileList[i][image]}"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //Container(height: MediaQuery.of(context).size.height),
              Container(
                  color: CustomTheme.almostWhite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
                  margin: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    children: [
                      Text('Hey there', style: CustomTheme.title),
                      Height(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8),
                        child: Text(
                            'Please let us know what type of activities you like the most, so we can prepare some awesome destinations for you!',
                            textAlign: TextAlign.center,
                            style: CustomTheme.bodyText),
                      ),
                      Height(30),
                      Wrap(
                        spacing: 40,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: list.map((e) {
                          return GestureDetector(
                            onTap: () {
                              if (list.any((item) => item.isSelected)) {
                                setState(() {
                                  e.isSelected = !e.isSelected;
                                });
                              } else {
                                setState(() {
                                  e.isSelected = true;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: e.isSelected
                                      ? CustomTheme.lightBlue.withOpacity(0.5)
                                      : Colors.white,
                                  border:
                                      Border.all(color: CustomTheme.borderGrey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    e.image,
                                    height: 14,
                                  ),
                                  Width(10),
                                  Text(
                                    e.text,
                                    style: CustomTheme.subtitle2.copyWith(
                                      color: e.isSelected
                                          ? Colors.white
                                          : CustomTheme.grey4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Height(40),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomTheme.boxShadow2,
                              blurRadius: 30,
                              offset: Offset(0, 8),
                            )
                          ],
                        ),
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 60),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeTab()));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(75),
                          ),
                          color: CustomTheme.lightBlue,
                          child:
                              Text('Continue', style: CustomTheme.buttonText),
                        ),
                      ),
                      Height(20),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeTab()));
                        },
                        child:
                            Text('Skip for now', style: CustomTheme.subtitle),
                      ),
                      Height(150),
                    ],
                  )),
              Positioned(
                top: 70,
                left: 100,
                right: 100,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomTheme.boxShadow,
                        blurRadius: 35,
                        offset: Offset(-1, 27),
                      )
                    ], color: Colors.white, shape: BoxShape.circle),
                    child:
                        Image.asset('assets/images/high_five.png', height: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
