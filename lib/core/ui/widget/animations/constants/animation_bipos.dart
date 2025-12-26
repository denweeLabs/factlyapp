class BiPos<T> {
  final T onTrue;   // begin
  final T onFalse;  // end
  const BiPos(this.onTrue, this.onFalse);
  T fromFlag(bool flag) => !flag ? onTrue : onFalse;
}