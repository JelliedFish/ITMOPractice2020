


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsView extends StatelessWidget {

  var  _statisticsPresenter;

  StatisticsView(StatisticsPresenter statisticsPresenter){
    _statisticsPresenter = statisticsPresenter;
  }


  Widget createFactElement(){
    return Scaffold(

      body: Container(
      padding: EdgeInsets.only(top: 50, left: 30),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Факт дня")
        ],
      ),
    ));
  }

  Widget createLevelElement(){
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(right: 70),
       child : Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Уровень знаний")
        ],
      ),
    ));
  }

  Widget createChartElement(){
    return LineChartSample2();
  }

  Widget createAVGElement(){
    return Scaffold(

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Выполненных \n вариантов",
                textAlign: TextAlign.center),
            Container(
              padding: EdgeInsets.only(top: 10),
                child : Text("5",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)))

          ],)),

          Container(
            padding: EdgeInsets.only(),
           child :Column(
             mainAxisAlignment: MainAxisAlignment.center,

             children: <Widget>[
              Text("Выполненных \n заданий",
                  textAlign: TextAlign.center),
              Container(
                padding: EdgeInsets.only(top:10),
             child: Text("4",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))

            ],
          )),

          Container(
            padding: EdgeInsets.only(),
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text("Средние баллы \n \t за тест:",
                  textAlign: TextAlign.center),
              Container(
                padding: EdgeInsets.only(top: 10),
                  child : Text("30",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)))
            ],
          ))
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
              child: createFactElement(),
                flex: 2,
              ),

              Expanded(
                child: createLevelElement(),
                flex: 2,
              ),

              Expanded(
                child: createChartElement(),
                flex: 9,
              ),

              Expanded(
                child: createAVGElement(),
                flex: 4,
              ),
            ],
          ),
       ));
  }
}


class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.20,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                color: Colors.white30),
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 0.0, top: 34, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 20,
          child: FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 15, color: showAvg ?  Colors.black: Colors.black.withOpacity(0.5), fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          textStyle:
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'ПН';
              case 2:
                return 'ВТ';
              case 4:
                return 'СР';
              case 6:
                return 'ЧТ';

              case 8:
                return 'ПТ';

              case 10:
                return 'СБ';

              case 12:
                return 'ВС';
            }
            return '';
          },
          margin: 6,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 2:
                return '20';
              case 3:
                return '30';
              case 4:
                return '40';
              case 5:
                return '50';
              case 6:
                return '62';
            }
            return '';
          },
          reservedSize: 28,
          margin: 10,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle:
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'ПН';
              case 2:
                return 'ВТ';
              case 4:
                return 'СР';
              case 6:
                return 'ЧТ';

              case 8:
                return 'ПТ';

              case 10:
                return 'СБ';

              case 12:
                return 'ВС';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 2:
                return '20';
              case 3:
                return '30';
              case 4:
                return '40';
              case 5:
                return '50';
              case 6:
                return '62';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
            FlSpot(12, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
