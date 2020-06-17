
import 'package:flutterapp/Catalog/variants/view/VariantsView.dart';

class VariantsPresenter{

  var _variantsView;

  get variantsView => _variantsView;

  VariantsPresenter(){
    _variantsView = new VariantsView(this);
  }
}