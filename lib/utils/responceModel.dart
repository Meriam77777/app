class ResponceModel {
  final bool _isSuccess;
  final String _message;

  ResponceModel(this._isSuccess, this._message);

  String get message => _message;

  bool get isSuccess => _isSuccess;
}