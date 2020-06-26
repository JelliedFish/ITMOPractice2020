
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Signature.dart';

class SignatureView extends StatefulWidget{
  var _signaturePresenter;


  SignatureView(this._signaturePresenter);

  @override
  State<StatefulWidget> createState() => _SignatureViewState(_signaturePresenter);

}

class _SignatureViewState extends State<SignatureView>{
  var _signaturePresenter;
  List<Offset> _points = <Offset>[];

  _SignatureViewState(this._signaturePresenter);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
              object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new Signature(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.clear),
        onPressed: () => _points.clear(),
      ),
    );
  }

}