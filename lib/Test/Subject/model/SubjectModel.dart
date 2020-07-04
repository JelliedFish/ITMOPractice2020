


class SubjectModel
{

  var _subject;

  get subject => _subject;

  set subject(value) {
    _subject = value;
  }

  var  _titleController;
  var _teacherName;
  var _textBook;
  var _textBookRef;
  var _description;
  var _homework;
  var _zoomRef;

  get zoomRef => _zoomRef;

  set zoomRef(value) {
    if (value != "") {
      _zoomRef = value;
    }
  }

  set titleController(value) {
    if (value != "") {
      _titleController = value;
    }
  }

  SubjectModel(this._titleController, this._teacherName, this._textBook,
      this._textBookRef, this._description, this._homework, this._zoomRef);


  SubjectModel.empty(String subject) {
    _subject = subject;
    _titleController = "Тема не задана";
    _teacherName = "ФИО неизвестно";
    _textBook = "Учебика нет";
    _textBookRef = "Ссылки на учебник нет";
    _description = "Описание отсутствует";
    _homework = "Домашнее задание отсутствует";
    _zoomRef = "Ссылка на Zoom не задана";
   }

  get homework => _homework;

  get description => _description;

  get textBookRef => _textBookRef;

  get textBook => _textBook;

  get teacherName => _teacherName;

  get titleController => _titleController;

  set teacherName(value) {
    if (value != "") {
      _teacherName = value;
    }
  }

  set homework(value) {
    if (value != "") {
      _homework = value;
    }
  }

  set description(value) {
    if (value != "") {
      _description = value;
    }
  }

  set textBookRef(value) {
    if (value != "") {
      _textBookRef = value;
    }
  }

  set textBook(value) {
    if (value != "") {
      _textBook = value;
    }
  }
}