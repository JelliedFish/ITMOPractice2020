




class GroupModel {
  var _groupPresenter;

  List<String> people;

  GroupModel(this._groupPresenter){
    people = [];
  }

  get groupPresenter => _groupPresenter;

  set groupPresenter(value) {
    _groupPresenter = value;
  }
}