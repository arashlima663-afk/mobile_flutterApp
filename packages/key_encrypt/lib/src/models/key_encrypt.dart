import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'key_encrypt.g.dart';

@JsonSerializable()
class AESDataModel extends Equatable {
  final String? ownerId;
  final List<int>? ciphertext;
  final List<int>? NMMvCS;
  final List<int>? finalList;
  final String? error;

  AESDataModel({
    this.ciphertext,
    this.NMMvCS,
    this.finalList,
    this.error,
    this.ownerId,
  });
  // Factory constructor for creating a new AESDataModel instance from JSON
  factory AESDataModel.fromJson(Map<String, dynamic> json) =>
      _$AESDataModelFromJson(json);

  // Method for converting an AESDataModel instance to JSON
  Map<String, dynamic> toJson() => _$AESDataModelToJson(this);
  // // From JSON
  // factory AESDataModel.fromJson(Map<String, dynamic> json) {
  //   return AESDataModel(
  //     ownerId: json['ownerId'],
  //     ciphertext: List<int>.from(json['ciphertext'] ?? []),
  //     NMMvCS: List<int>.from(json['NMMvCS'] ?? []),
  //     finalList: json['finalList'] != null
  //         ? List<int>.from(json['finalList'])
  //         : null,
  //     error: json['error'],
  //   );
  // }

  // // To JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'ownerId': ownerId,
  //     'ciphertext': ciphertext,
  //     'NMMvCS': NMMvCS,
  //     'finalList': finalList,
  //     'error': error?.toString(),
  //   };
  // }

  AESDataModel copyWith({
    String? ownerId,
    List<int>? ciphertext,
    List<int>? NMMvCS,
    List<int>? finalList,
    String? error,
  }) {
    return AESDataModel(
      ownerId: ownerId ?? this.ownerId,
      ciphertext: ciphertext ?? this.ciphertext,
      NMMvCS: NMMvCS ?? this.NMMvCS,
      finalList: finalList ?? this.finalList,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [ownerId, ciphertext, NMMvCS, finalList, error];
}
