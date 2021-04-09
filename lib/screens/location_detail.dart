import 'package:flutter/material.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import '../theme.dart';

class LocationDetail extends StatefulWidget {
  final String image, title, amount;
  final tag;

  const LocationDetail({Key key, this.image, this.title, this.amount, this.tag})
      : super(key: key);

  @override
  _LocationDetailState createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail>
    with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  Animation _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 20, end: 30),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 20),
        weight: 50,
      ),
    ]).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  // dismiss the animation when widgit exits screen
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: CustomTheme.scaffoldColor,
              leadingWidth: 100,
              pinned: true,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.only(left: 30, top: 30),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: CustomTheme.lighterBlue.withOpacity(0.8),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
              ),
              actions: [
                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, _) {
                      return Container(
                        margin: const EdgeInsets.only(right: 50, top: 30),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          color: CustomTheme.lighterBlue.withOpacity(0.8),
                          onPressed: () {
                            isFav
                                ? _controller.reverse()
                                : _controller.forward();
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_outline,
                            size: _sizeAnimation.value,
                          ),
                        ),
                      );
                    }),
              ],
              expandedHeight: 500.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.tag,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/location1.png',
                      //height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 80.0,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/locationD1.png',
                          scale: 3,
                        ),
                        Image.asset(
                          'assets/images/locationD2.png',
                          scale: 3,
                        ),
                        Image.asset(
                          'assets/images/locationD1.png',
                          scale: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFixedExtentList(
                itemExtent: 30.0,
                delegate: SliverChildListDelegate([
                  Height(10),
                  Container(
                    margin: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                    child: Text(
                      widget.title,
                      style: CustomTheme.label.copyWith(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Abraka, Delta State Nigeria',
                          style:
                              CustomTheme.subtitleLight.copyWith(fontSize: 12),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating',
                              style: CustomTheme.subtitleLight
                                  .copyWith(fontSize: 8),
                            ),
                            Text(
                              '4.6 out of 5',
                              style: CustomTheme.subtitle2
                                  .copyWith(color: CustomTheme.grey6),
                            ),
                          ],
                        ),
                        Text(widget.amount,
                            style: CustomTheme.greenText
                                .copyWith(color: CustomTheme.lightGreen))
                      ],
                    ),
                  ),
                  Height(10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      'Description',
                      style:
                          CustomTheme.title2.copyWith(color: CustomTheme.grey6),
                    ),
                  ),
                ])),
            SliverFixedExtentList(
                itemExtent: 400.0,
                delegate: SliverChildListDelegate([
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  molli dictumst, aenean non a in donec nulla.Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  mollis dictumst, aene an non a in donec nulla. \n Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  molli dictumst, aenean non a in donec nulla.Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  mollis dictumst, aene an non a in donec nulla. Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  molli dictumst, aenean non a in donec nulla.Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  mollis dictumst, aene an non a in donec nulla. \n Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  molli dictumst, aenean non a in donec nulla.Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies  mollis dictumst, aene an non a in donec nulla. ",
                      style: CustomTheme.subtitleLight.copyWith(fontSize: 14),
                    ),
                  ),
                ])),
            SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildListDelegate([
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 95),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 60),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75),
                      ),
                      color: CustomTheme.lightBlue,
                      child: Text('Book now', style: CustomTheme.buttonText),
                    ),
                  ),
                  Height(300),
                ])),
          ],
        ),
      ),
    );
  }
}
