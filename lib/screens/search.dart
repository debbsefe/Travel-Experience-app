import 'package:flutter/material.dart';
import 'package:travel_experience/widgets/input_decoration.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import '../theme.dart';

class Slide {
  final String image;
  final String title, subtitle, amount;

  Slide({this.title, this.subtitle, this.amount, @required this.image});
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final slideList = [
    Slide(
      amount: 'N40,000/night',
      image: 'assets/images/search1.png',
      title: 'Rice Bowl Resturant',
      subtitle: 'Abuja, Nigeria',
    ),
    Slide(
      amount: 'N50,000/night',
      image: 'assets/images/search1.png',
      title: 'Rice Bowl Resturant',
      subtitle: 'Abuja, Nigeria',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            readOnly: true,
            decoration: roundedInputDecoration.copyWith(
              hintText: 'Search by country, location ...',
              suffixIconConstraints: BoxConstraints(maxWidth: 40),
              suffixIcon: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/images/search.png', height: 20)),
              hintStyle:
                  CustomTheme.subtitle.copyWith(color: CustomTheme.grey5),
            ),
            onChanged: (String val) {},
          ),
          Height(40),
          Text('Top Searches',
              textAlign: TextAlign.start,
              style: CustomTheme.subtitle2.copyWith(color: CustomTheme.grey6)),
          Height(20),
          Column(
              children: slideList.asMap().entries.map((entry) {
            var e = entry.value;
            return GestureDetector(
              key: UniqueKey(),
              onTap: () => {
                setState(() {
                  slideList.removeAt(entry.key);
                })
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SearchWidget(
                  amount: e.amount,
                  image: e.image,
                  title: e.title,
                  subtitle: e.subtitle,
                ),
              ),
            );
          }).toList()),
        ]),
      )),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final String image, title, subtitle, amount;

  const SearchWidget(
      {Key key, this.image, this.title, this.subtitle, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(image, height: 60),
            Width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: CustomTheme.label,
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: CustomTheme.subtitleLight,
                    ),
                    Width(10),
                    Text(amount,
                        style: CustomTheme.subtitleLight
                            .copyWith(color: CustomTheme.lightGreen))
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Image.asset(
            'assets/images/cancel.png',
            height: 15,
          ),
        )
      ],
    );
  }
}
