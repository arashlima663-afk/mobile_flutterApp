import 'package:cryptography/cryptography.dart';
import 'package:equatable/equatable.dart';

base class KeyModel extends Equatable {
  final String? ownerId;
  final SecretKey? aesSecretKey;
  final List<int>? aesNonce;

  final String? error;

  KeyModel({this.ownerId, this.aesSecretKey, this.aesNonce, this.error}) {}

  Future<Map<String, dynamic>> toJson() async {
    return {
      'ownerId': ownerId,
      'aesSecretKey': await aesSecretKey?.extractBytes(),
      'aesNonce': aesNonce,
      'error': error,
    };
  }

  @override
  List<Object?> get props => [ownerId, aesNonce, aesSecretKey, error];
}
