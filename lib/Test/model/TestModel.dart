



class TestModel {
  var _testPresenter;
  var _group;
  var _week;
  var _dayOfTheWeek;
  var _title;

  TestModel(this._testPresenter);

  get group => _group;

  set group(value) {
    _group = value;
  }

  get week => _week;

  set week(value) {
    _week = value;
  }

  get testPresenter => _testPresenter;

  get dayOfTheWeek => _dayOfTheWeek;

  set dayOfTheWeek(value) {
    _dayOfTheWeek = value;
  }

  set testPresenter(value) {
    _testPresenter = value;
  }

  get title => _title;

  set title(value) {
    _title = value;
  }
}