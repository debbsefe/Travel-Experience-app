import 'package:flutter/material.dart';

import '../theme.dart';

class LocationDetail extends StatelessWidget {
  final String image;

  const LocationDetail({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: CustomTheme.scaffoldColor,
              leading: Container(
                margin: const EdgeInsets.only(left: 30, top: 30),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: CustomTheme.lighterBlue.withOpacity(0.8),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      image,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
