


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


  Widget createFactAndLevelElement(BuildContext context){
    return Scaffold(

      body: Container(
      padding: EdgeInsets.only(top : 45),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(


              height: 50,
              width: 135,


              decoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart, _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                ),
                color: _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child : FlatButton(
              shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  color: Colors.transparent,


              child : Center( child : Text("Факт дня", style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
            onPressed: (){
              showDialog(context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context){

                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text("Факт:"),
                  content: Text("По статистике , если проверять задание во время выполнения, то количество ошибок уменьшается на 70%",textAlign: TextAlign.center),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
              );
            }
              )),

        Container(
            width: 135,
            height: 50,


            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart, _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
              ),
              color: _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: FlatButton(
              shape:  RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
              padding: EdgeInsets.only(left: 5, right: 5),


                  child : Center( child : Text("Уровень знаний", style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
              onPressed: (){
                showDialog(context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context){

                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("Уровень знаний:"),
                        content: Text("Твой уровень знаний - Начинающий !",textAlign: TextAlign.center),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                );
              }
          ))
        ])
      ),
    );
  }


  Widget createChartElement(){
    return LineChartSample2(_statisticsPresenter);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
              child: createFactAndLevelElement(context),
                flex: 3,
              ),

              Expanded(
                child: createChartElement(),
                flex: 9,
              ),

              Expanded(
                child: createAVGElement(),
                flex: 3,
              ),
            ],
          ),
       ));
  }
}


class LineChartSample2 extends StatefulWidget {
  var _statisticsPresenter;

  LineChartSample2(StatisticsPresenter statisticsPresenter){
    _statisticsPresenter = statisticsPresenter;
  }

  @override
  _LineChartSample2State createState() => _LineChartSample2State(_statisticsPresenter);
}

class _LineChartSample2State extends State<LineChartSample2> {

  var _statisticsPresenter;

  List<Color> gradientColors = new List<Color>();

  _LineChartSample2State(StatisticsPresenter statisticsPresenter){
    _statisticsPresenter = statisticsPresenter;
    gradientColors.add( _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart);
    gradientColors.add( _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd);
  }


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
                color:  Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 0.0, top: 34, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.end,

          children: <Widget>[
            FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'Средний балл',
              style: TextStyle(
                  fontSize: 15, color: showAvg ?  Colors.white: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
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
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
              case 62:
                return '62';
            }
            return '';
          },
          reservedSize: 22,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 62,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 20),
            FlSpot(2.6, 20),
            FlSpot(4.9, 50),
            FlSpot(6.8, 30.1),
            FlSpot(8, 40),
            FlSpot(9.5, 30),
            FlSpot(11, 40),
            FlSpot(12, 40),
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
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: false,
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
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
              case 50:
                return '50';
              case 62:
                return '62';
            }
            return '';
          },
          reservedSize: 22,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 62,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 30.44),
            FlSpot(2.6, 30.44),
            FlSpot(4.9, 30.44),
            FlSpot(6.8, 30.44),
            FlSpot(8, 30.44),
            FlSpot(9.5, 30.44),
            FlSpot(11, 30.44),
            FlSpot(12, 30.44),
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
