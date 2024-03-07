import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';
import 'package:cdtest/commons/textStyle.dart';
import 'package:cdtest/widgets/my_elevated_button.dart';
import 'package:cdtest/ui/a.dart';

class ShowDetail extends StatefulWidget {
  final String quest, ans;
  static var randomNumber = Random();

  ShowDetail({required this.quest, required this.ans});

  static final List<Color> _colors = [
    Colors.red,
    Colors.teal,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.blue,
  ];

  @override
  ShowDetailState createState() {
    return ShowDetailState();
  }
}

class ShowDetailState extends State<ShowDetail> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  share(String question, String answer) {
    Share.share("Q:" +
        question +
        "\n\n" +
        "A:" +
        answer +
        "\n\nDownload the app for more amazing Q/A\n " +
        "https://play.google.com/store/apps/details?id=tricky.questions");
  }

  ///add details in card.
  Widget cardDetail(String text) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
              borderRadius: BorderRadius.circular(9.0),
              color: ShowDetail._colors[ShowDetail.randomNumber.nextInt(100) %
                  ShowDetail._colors.length],
            ),
            margin: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Style.commonTextStyle,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Color(0xFFC67A7D),
        title: Text('Coding Question'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              "Question :",
              style: Style.headerTextStyle,
            ),
          ),
          cardDetail(widget.quest),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              'Write your Code Below :',
              style: Style.headerTextStyle,
            ),
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CodeBlockWidget()
            ),
            Lottie.asset(
              'assets/confetti.json',
              controller: _controller,
              repeat: false,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
              
            ),
          ]),
          SizedBox(height: 20),
          MyElevatedButton(
            padding: EdgeInsets.all(5),
            shape: BeveledRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            splashColor: const Color(0xff382151),
            elevation: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SUBMIT",
                  style: Style.regularTextStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_circle_right),
              ],
            ),
            color: Color(0xFF56cfdf),
            onPressed: () => share(widget.quest, widget.ans),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
