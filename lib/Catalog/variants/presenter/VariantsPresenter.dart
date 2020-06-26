
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/variants/view/VariantsView.dart';

class VariantsPresenter{

  var _variantsView;
  var _catalogPresenter;

  get variantsView => _variantsView;

  get catalogPresenter => _catalogPresenter;

  VariantsPresenter(CatalogPresenter catalogPresenter){
    _variantsView = new VariantsView(this);
    _catalogPresenter = catalogPresenter;
  }
}