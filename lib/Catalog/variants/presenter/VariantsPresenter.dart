
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/variants/model/VariantsModel.dart';
import 'package:flutterapp/Catalog/variants/view/VariantsView.dart';

class VariantsPresenter{

  var _variantsView;
  var _catalogPresenter;
  var _variantsModel;

  get variantsView => _variantsView;

  get catalogPresenter => _catalogPresenter;

  VariantsPresenter(CatalogPresenter catalogPresenter){
    _variantsModel = new VariantsModel(catalogPresenter.catalogModel);
    _variantsView = new VariantsView(this, _variantsModel);
    _catalogPresenter = catalogPresenter;
  }
}