//Jeet
// ignore_for_file: prefer_collection_literals, unnecessary_this

class GetTransictionModal {
  List<TransactionsList>? transactionsList;

  GetTransictionModal({this.transactionsList});

  GetTransictionModal.fromJson(Map<String, dynamic> json) {
    if (json['transactions_list'] != null) {
      transactionsList = <TransactionsList>[];
      json['transactions_list'].forEach((v) {
        transactionsList!.add(TransactionsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transactionsList != null) {
      data['transactions_list'] =
          transactionsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionsList {
  int? amount;
  String? email;
  String? googleadsAccountId;
  String? status;
  String? transactionDate;
  String? transactionId;
  String? transactionType;

  TransactionsList(
      {this.amount,
      this.email,
      this.googleadsAccountId,
      this.status,
      this.transactionDate,
      this.transactionId,
      this.transactionType});

  TransactionsList.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    email = json['email'];
    googleadsAccountId = json['googleads_account_id'];
    status = json['status'];
    transactionDate = json['transaction_date'];
    transactionId = json['transaction_id'];
    transactionType = json['transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['amount'] = this.amount;
    data['email'] = this.email;
    data['googleads_account_id'] = this.googleadsAccountId;
    data['status'] = this.status;
    data['transaction_date'] = this.transactionDate;
    data['transaction_id'] = this.transactionId;
    data['transaction_type'] = this.transactionType;
    return data;
  }
}
