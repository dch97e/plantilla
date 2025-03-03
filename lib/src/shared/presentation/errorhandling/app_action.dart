enum AppAction {
  UNKNOWN(-1),
  NONE(0),
  SIGN_IN(1),
  GET_ARTISTS(2);

  const AppAction(this.value);

  final int value;
}
