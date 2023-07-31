// Jeet
class GetBalanceModal {
  String? email;
  // ignore: non_constant_identifier_names
  String? google_balance;
  // ignore: non_constant_identifier_names
  String? googleads_account_id;
  String? status;
  // ignore: non_constant_identifier_names
  String? wallet_balance;

  GetBalanceModal(
      {required this.email,
      // ignore: non_constant_identifier_names
      required this.google_balance,
      // ignore: non_constant_identifier_names
      required this.googleads_account_id,
      required this.status,
      // ignore: non_constant_identifier_names
      required this.wallet_balance});

  GetBalanceModal.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    google_balance = json['google_balance'];
    googleads_account_id = json['googleads_account_id'];
    status = json['status'];
    wallet_balance = json['wallet_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['google_balance'] = google_balance;
    data['googleads_account_id'] = googleads_account_id;
    data['status'] = status;
    data['wallet_balance'] = wallet_balance;
    return data;
  }
}
