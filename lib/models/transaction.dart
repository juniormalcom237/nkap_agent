import 'package:nkap_agent/models/users.dart';

class Transaction {
  final String id;
  // final String ref;
  final String type;
  final String amount;
  final String clientId;
  final String collectorId;
  final String date;
  Users? user;

  Transaction(
      {required this.user,
      required this.id,
      required this.date,
      // required this.ref,
      required this.type,
      required this.amount,
      required this.clientId,
      required this.collectorId});

  factory Transaction.fromJson(dynamic json) {
    return Transaction(
      id: json['id'],
      // ref: json['ref'],
      type: json['type'],
      amount: json['amount'],
      clientId: json['contributorId'],
      collectorId: json['collectorId'],
      date: json['created_at'],
      user: Users.fromJson(json['Client']),
    );
  }
}
