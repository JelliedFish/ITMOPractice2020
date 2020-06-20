import 'package:flutter/cupertino.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/liquid_progress_indicator/src/liquid_custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final double _value;
  final String _text;
  final Color _color;
  final CatalogPresenter _catalogPresenter;

  Item(this._value, this._text, this._color, this._catalogPresenter);

  @override
  State<StatefulWidget> createState() => ItemState(_value, _text, _color, _catalogPresenter);
}

class ItemState extends State<Item> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  final double value;
  final String text;
  final Color color;
  final CatalogPresenter _catalogPresenter;

  ItemState(this.value, this.text, this.color, this._catalogPresenter);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (value * 100).toInt();
    return Center(
        child: GestureDetector(
            onTap: (){
              _catalogPresenter.goToTest(context);
            },
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
              child: LiquidCustomProgressIndicator(
                value: value,
                direction: Axis.vertical,
                backgroundColor: Color.fromRGBO(213, 212, 211, 0.33),
              valueColor: AlwaysStoppedAnimation(color),
              shapePath: _buildHeartPath(),
                center: Text(
                  "$text",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
        )
    );
  }

  Path _buildHeartPath() {
    Path path = new Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, 100, 100), Radius.circular(10)));
    return path;
  }

}
