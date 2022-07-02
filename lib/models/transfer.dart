class Transfer {
  final double value;
  final int account;

  Transfer({
    required this.value,
    required this.account,
  });

  @override
  String toString() {
    return 'Transfered to \nAccount: $account \nValue: $value';
  }
}
