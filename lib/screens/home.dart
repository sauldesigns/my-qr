import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen/services/navigation.dart';
import 'package:qr_gen/services/service_locator.dart';
import 'package:qr_gen/shared/card_view.dart';
import 'package:qr_gen/theme/mycolors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationService navService;
  List<Widget> pageList = <Widget>[
    _FirstPage(),
    _SecondPage(),
    _ThirdPage(),
    // _FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    navService = Provider.of<NavigationService>(context);
    return Scaffold(
      // backgroundColor: MyColors.bg,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   title: Text('My QR'),
      // ),
      bottomNavigationBar: CustomBottomNav(),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: pageList[navService.index],
      ),
    );
  }
}

class CustomBottomNav extends StatefulWidget {
  CustomBottomNav({Key key}) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  NavigationService navService;
  @override
  Widget build(BuildContext context) {
    navService = Provider.of<NavigationService>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16,
            ),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.link,
                    text: 'Link',
                    backgroundColor: MyColors.qrBg,
                  ),
                  GButton(
                    icon: Icons.mail,
                    text: 'E-mail',
                    backgroundColor: MyColors.qrBg,
                  ),
                  GButton(
                    icon: Icons.text_fields,
                    text: 'Text',
                    backgroundColor: MyColors.qrBg,
                  ),
                  // GButton(
                  //   icon: Icons.person,
                  //   text: 'Profile',
                  // ),
                ],
                selectedIndex: navService.index,
                onTabChange: (index) {
                  navService.changeIndex(index);
                }),
          ),
        ),
      ),
    );
  }
}

class _FirstPage extends StatefulWidget {
  _FirstPage({Key key}) : super(key: key);

  @override
  __FirstPageState createState() => __FirstPageState();
}

class __FirstPageState extends State<_FirstPage> {
  TextEditingController _textController = new TextEditingController();

  String data;
  @override
  void initState() {
    super.initState();
    _textController.text = 'https://';
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
      qrData: data,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.textFieldBg,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Link',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  controller: _textController,
                  onChanged: (value) => data = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter link here',
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            onPressed: () {
              setState(() {});
            },
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text('Submit'),
            ),
          ),
        )
      ],
    );
  }
}

class _SecondPage extends StatefulWidget {
  _SecondPage({Key key}) : super(key: key);

  @override
  __SecondPageState createState() => __SecondPageState();
}

class __SecondPageState extends State<_SecondPage> {
  TextEditingController _textController = new TextEditingController();
  TextEditingController _subjectController = new TextEditingController();
  String _email = '';
  String _subject = '';
  String data;
  @override
  void initState() {
    super.initState();
    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return CardView(
      qrData: data,
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.textFieldBg,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('E-mail',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  controller: _textController,
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'john@smith.com',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.textFieldBg,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Subject',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  autofocus: true,
                  controller: _subjectController,
                  onChanged: (value) => _subject = value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a subject here',
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            onPressed: () {
              setState(() {
                data = 'mailto:' + _email + '?subject=' + _subject;
              });
            },
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text('Submit'),
            ),
          ),
        )
      ],
    );
  }
}

class _ThirdPage extends StatelessWidget {
  const _ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hi'),
    );
  }
}

// class _FourthPage extends StatelessWidget {
//   const _FourthPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('hi'),
//     );
//   }
// }
