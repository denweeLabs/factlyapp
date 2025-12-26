class NetworkTask {
  final String name;
  final Function processingFunction;

  const NetworkTask(
    this.name,
    this.processingFunction
  );

  String toInfoString(bool isPerform) {
    return '***** ${isPerform ? 'Do' : 'Add new'} Network Task ««« $name »»»';
  }
}
