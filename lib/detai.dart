import 'package:flutter/material.dart';

final _gutter = 32.0;

final _buttonsList = [
  {
    'icon': Icons.call,
    'label': 'call',
  },
  {
    'icon': Icons.near_me,
    'label': 'route',
  },
  {
    'icon': Icons.share,
    'label': 'share',
  }
];

Column buildButtonColumn(IconData icon, String label, BuildContext context) {
  Color color = Theme.of(context).primaryColor;
  return new Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Icon(icon, color: color),
      new Container(
        margin: EdgeInsets.only(top: 8.0),
        child: new Text(label,
            style: new TextStyle(color: color, fontWeight: FontWeight.w400)),
      ),
    ],
  );
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget headerSection = new Image.asset(
      'assets/images/lake.jpeg',
      height: 30.0,
      fit: BoxFit.cover,
    );

    Widget titleSection = new Container(
      padding: EdgeInsets.all(_gutter),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(_gutter),
                  child: new Text(
                    'Hello, my queen !',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  'how are you today ?',
                  style: new TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          new Icon(Icons.star, color: Colors.yellow),
          new Text('100')
        ],
      ),
    );

    Widget buttonsSection = new Row(
      children: List.from(_buttonsList.map((item) {
        return buildButtonColumn(
          item['icon'],
          item['label'].toString().toUpperCase(),
          context,
        );
      })),
    );

    Widget descriptionSection = new Row(
      children: [
        new Container(
          padding: EdgeInsets.all(_gutter),
          child: new Text(
            '''
            Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
            ''',
            softWrap: true,
          ),
        ),
      ],
    );

    return new MaterialApp(
      title: 'Detail',
      theme: new ThemeData(primarySwatch: Colors.white),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Detail title'),
        ),
        body: new ListView(
          children: <Widget>[
            headerSection,
            titleSection,
            buttonsSection,
            descriptionSection,
          ],
        ),
      ),
    );
  }
}
