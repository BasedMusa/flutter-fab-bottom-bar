import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String error;
  final SharedPreferences sharedPreferences;

  HomePage({this.error, this.sharedPreferences});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 2;

  @override
  Widget build(BuildContext context) =>
  Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  mediaQueryHeightPercentage(double percentage) =>
      (MediaQuery.of(context).size.height / 100) * percentage;

  mediaQueryWidthPercentage(double percentage) =>
      (MediaQuery.of(context).size.width / 100) * percentage;

  _bottomNavigationBar() => BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (selection) {
            setState(() {
              selectedPage = selection;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.facebookMessenger,
                color: selectedPage == 0 ? Colors.black : Colors.grey[500],
              ),
              title: Text(
                'Messages',
                style: TextStyle(
                  color: selectedPage == 0 ? Colors.black : Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidBell,
                color: selectedPage == 1 ? Colors.black : Colors.grey[500],
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  color: selectedPage == 1 ? Colors.black : Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                color: ColorPalette.backgroundColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: ColorPalette.backgroundColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
                color: selectedPage == 3 ? Colors.black : Colors.grey[500],
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: selectedPage == 3 ? Colors.black : Colors.grey[500],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: selectedPage == 4 ? Colors.black : Colors.grey[500],
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: selectedPage == 4 ? Colors.black : Colors.grey[500],
                ),
              ),
            ),
          ]);

  _appBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        centerTitle: true,
        brightness: Brightness.light,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      );

  _fab() => AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: selectedPage != 2
          ? EdgeInsets.only(
              top: mediaQueryHeightPercentage(5),
              right: selectedPage > 2 ? mediaQueryWidthPercentage(8) : 0.0,
              left: selectedPage < 2 ? mediaQueryWidthPercentage(8) : 0.0,
            )
          : EdgeInsets.only(top: mediaQueryHeightPercentage(3)),
      height: selectedPage == 2
          ? mediaQueryHeightPercentage(8)
          : mediaQueryHeightPercentage(7),
      width: selectedPage == 2
          ? mediaQueryHeightPercentage(8)
          : mediaQueryHeightPercentage(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mediaQueryHeightPercentage(2.5)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: userProfile.hasPremium ?? false
                  ? ColorPalette.appThemedGradientColorsPremium
                  : ColorPalette.appThemedGradientColors),
          boxShadow: selectedPage == 2
              ? [
                  BoxShadow(
                      color: ColorPalette.appThemedGradientColors[1]
                          .withOpacity(0.6),
                      blurRadius: 25,
                      offset: Offset(0, 10))
                ]
              : null),
      child: InkWell(
        borderRadius: BorderRadius.circular(mediaQueryHeightPercentage(2.5)),
        onTap: () {
          setState(() {
            selectedPage = 2;
          });
        },
        child: Icon(
          FontAwesomeIcons.simplybuilt,
          size: mediaQueryHeightPercentage(3),
          color: Colors.white,
        ),
      ));
}

class ColorPalette {
  static Color backgroundColor = Color(0xFFFCFCFC);

  static Color boldTitleColor = Colors.grey[900];
  static Color subtitleColor = Colors.grey[600];
  static Color subtitleColorLight = Colors.grey[400];

  static List<Color> appThemedGradientColors = [
    Color(0xFFAD5389),
    Color(0xFF3C1053),
  ];

  static List<Color> appThemedGradientColorsPremium = [
    Color(0xFFFBAB66),
    Color(0xFFF7418C),
  ];

}

