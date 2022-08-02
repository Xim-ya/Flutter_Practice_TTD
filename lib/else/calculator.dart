class Calculator {
  Calculator({required this.firstNum, required this.secondNum});

  final int firstNum;
  final int secondNum;

  int add() => firstNum + secondNum;
  int minus() => firstNum - secondNum;
}
