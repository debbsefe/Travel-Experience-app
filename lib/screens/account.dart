import 'package:flutter/material.dart';
import 'package:travel_experience/widgets/sizedbox.dart';

import '../theme.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/avatarB.png',
                        scale: 3,
                      ),
                    ),
                    Text('Dera Davis',
                        style: CustomTheme.label.copyWith(fontSize: 14)),
                    Height(15),
                    FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 1),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75),
                      ),
                      color: CustomTheme.orange,
                      child: Text('Traveller',
                          style: CustomTheme.buttonText.copyWith(fontSize: 12)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(bottom: 23),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    AccountTile(
                        color: CustomTheme.faintBlue,
                        image: 'assets/images/smile.png',
                        title: 'Username'),
                    AccountTile(
                        color: CustomTheme.faintPurple,
                        image: 'assets/images/star.png',
                        title: 'Review ratings'),
                    AccountTile(
                        color: CustomTheme.faintGreen,
                        image: 'assets/images/share.png',
                        title: 'Share our App'),
                    AccountTile(
                        color: CustomTheme.faintOrange,
                        image: 'assets/images/settings.png',
                        title: 'Settings')
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

class AccountTile extends StatelessWidget {
  final String title, image;

  final Color color;

  const AccountTile({Key key, this.title, this.image, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13),
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              image,
              scale: 3,
            )),
        title: Text(
          title,
          style: CustomTheme.label.copyWith(fontSize: 16),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
