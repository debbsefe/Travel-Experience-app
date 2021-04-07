import 'package:flutter/material.dart';
import 'package:travel_experience/widgets/input_decoration.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import '../theme.dart';
import 'locations.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Height(10),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: CustomTheme.pink, shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            height: 32,
                          ),
                        ),
                        Width(10),
                        const Text('Hi, Dera', style: CustomTheme.titleLight),
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
              Height(10),
              Text('Explore sunbathing',
                  style: CustomTheme.title.copyWith(fontSize: 32)),
              Height(10),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                    'Here you can explore our most popular and recommended sunbathing locations',
                    textAlign: TextAlign.start,
                    style: CustomTheme.bodyText),
              ),
              Height(10),
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
              Expanded(
                flex: 4,
                child: tabs(),
              ),
              Text(
                'Places you might like',
                style: CustomTheme.subtitle2.copyWith(color: CustomTheme.grey6),
              ),
              Height(10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/place1.png', height: 60),
                    Width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jabi Boat Club',
                          style: CustomTheme.label,
                        ),
                        Row(
                          children: [
                            Text(
                              'Abuja, Nigeria',
                              style: CustomTheme.subtitleLight,
                            ),
                            Width(10),
                            Text('N40,000/night',
                                style: CustomTheme.subtitleLight
                                    .copyWith(color: CustomTheme.lightGreen))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Height(10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/place1.png', height: 60),
                    Width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jabi Boat Club',
                          style: CustomTheme.label,
                        ),
                        Row(
                          children: [
                            Text(
                              'Abuja, Nigeria',
                              style: CustomTheme.subtitleLight,
                            ),
                            Width(10),
                            Text('N40,000/night',
                                style: CustomTheme.subtitleLight
                                    .copyWith(color: CustomTheme.lightGreen))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
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
          indicator:
              CircleTabIndicator(color: CustomTheme.lightBlue, radius: 5),
          labelStyle: CustomTheme.label,
          unselectedLabelStyle: CustomTheme.labelLight,
          labelColor: CustomTheme.grey6,
          unselectedLabelColor: CustomTheme.grey7,
        ),
      ));
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
