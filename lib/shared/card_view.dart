import 'package:flutter/material.dart';
import 'package:qr_gen/theme/mycolors.dart';

class CardView extends StatefulWidget {
  final List<Widget> children;
  final String qrData;
  CardView(
      {Key key,
      this.children,
      this.qrData = 'Looks like you have made no changes.'})
      : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: MyColors.qrBg, borderRadius: BorderRadius.circular(50)),
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    Image.network(
                      'https://api.qrserver.com/v1/create-qr-code/?data=${widget.qrData}&size=500x500&bgcolor=26-32-89&color=255-255-255',
                      width: 150,
                      height: 150,
                    ),
                  ] +
                  widget.children,
            ))
          ],
        ),
      ),
    );
  }
}
