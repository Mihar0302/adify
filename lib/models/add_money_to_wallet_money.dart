// Jeet
class AddMoneyToWallet {
  String? amount;

  AddMoneyToWallet({
    required this.amount,
  });

  AddMoneyToWallet.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    return data;
  }
}


