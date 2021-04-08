import 'package:flutter/material.dart';
import 'package:travel_experience/theme.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import 'location_detail.dart';

class TopLocations extends StatefulWidget {
  @override
  _TopLocationsState createState() => _TopLocationsState();
}

class _TopLocationsState extends State<TopLocations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: slideList.length,
        itemBuilder: (ctx, i) => SlideItem(i),
      ),
    );
  }
}

class Slide {
  final String image;
  final String title, subtitle, amount;

  Slide({this.title, this.subtitle, this.amount, @required this.image});
}

final slideList = [
  Slide(
      image: 'assets/images/sunbath1.png',
      title: 'Abraka Beach',
      subtitle: 'Delta State',
      amount: 'N50,000/night'),
  Slide(
      image: 'assets/images/sunbath2.png',
      title: 'Lagos Beach',
      subtitle: 'Delta State',
      amount: 'N50,000/night'),
  Slide(
      image: 'assets/images/sunbath1.png',
      title: 'Abraka Beach',
      subtitle: 'Delta State',
      amount: 'N50,000/night'),
];

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    var tag = UniqueKey();
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationDetail(
                            image: slideList[index].image,
                            title: slideList[index].title,
                            amount: slideList[index].amount,
                            tag: tag,
                          )));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Hero(
                      tag: tag,
                      child: Image.asset(slideList[index].image, height: 100)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Width(5),
                          Text(
                            slideList[index].title,
                            style: CustomTheme.label
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Width(5),
                          Text(slideList[index].subtitle,
                              style: CustomTheme.subtitleLight),
                          Width(10),
                          Text(slideList[index].amount,
                              style: CustomTheme.subtitleLight
                                  .copyWith(color: CustomTheme.lightGreen))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
