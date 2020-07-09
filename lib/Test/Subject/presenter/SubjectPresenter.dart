import 'package:flutterapp/Test/Subject/model/SubjectModel.dart';
import 'package:flutterapp/Test/Subject/view/SubjectView.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';

class SubjectPresenter {

  var _subjectView;
  var _subjectModel;
  var _subject;

  get subjectView => _subjectView;

  var _testPresenter;
  get testPresenter => _testPresenter;

  SubjectPresenter(TestPresenter testPresenter){
    _testPresenter = testPresenter;
    if (_subject != null) {
      _subjectModel = new SubjectModel.empty(_subject,this);
    }
    else {
      _subjectModel = new SubjectModel.empty("Урок не задан",this);
    }
    _subjectView = new SubjectView(this,_subjectModel);
  }

  get subject => _subject;

  set subject(value) {
    _subject = value;
  }

  get subjectModel => _subjectModel;
}