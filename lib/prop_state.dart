
typedef VoidCallback = void Function();

class PropState<T>{
  T _value;
  final List<VoidCallback> _listeners = [];

  PropState(this._value);

  T get value => _value;

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _notifyListeners();
    }
  }

  void update(T Function(T) updater) {
    final newValue = updater(_value);
    if (newValue != _value) {
      _value = newValue;
      _notifyListeners();
    }
  }
  

  
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }
  

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }
}
