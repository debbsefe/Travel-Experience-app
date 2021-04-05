import 'package:flutter/material.dart';
import 'package:travel_experience/widgets/input_decoration.dart';

import '../theme.dart';
import 'locations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 3),
                          decoration: const BoxDecoration(
                              color: CustomTheme.pink, shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            height: 32,
                          ),
                        ),
                        const Text('Hi, Dera'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.asset(
                        'assets/images/bell.png',
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Text('Explore eateries',
                      style: CustomTheme.title.copyWith(fontSize: 32))),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                      'Here you can explore our most popular and recommended sunbathing locations',
                      textAlign: TextAlign.justify,
                      style: CustomTheme.bodyText),
                ),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  readOnly: true,
                  decoration: roundedInputDecoration.copyWith(
                    hintText: 'Search',
                    suffixIconConstraints: BoxConstraints(maxWidth: 40),
                    suffixIcon: Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset('assets/images/search.png',
                            height: 20)),
                    hintStyle:
                        CustomTheme.subtitle.copyWith(color: CustomTheme.grey5),
                  ),
                  onChanged: (String val) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DefaultTabController tabs() {
  return DefaultTabController(
      length: 4,
      child: new Scaffold(
        body: TabBarView(
          children: <Widget>[
            TopLocations(),
            TopLocations(),
            TopLocations(),
            TopLocations()
          ],
        ),
        appBar: new TabBar(
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                'Top locations',
              ),
            ),
            Tab(
              child: Text(
                'Newest',
              ),
            ),
            Tab(
              child: Text(
                'Best locations for you',
              ),
            ),
            Tab(
              child: Text(
                'Recommended',
              ),
            ),
          ],
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: CustomTheme.lightBlue),
            //insets: EdgeInsets.symmetric(horizontal: 50.0)
          ),
          labelStyle: CustomTheme.label,
          unselectedLabelStyle: CustomTheme.labelLight,
        ),
      ));
}
