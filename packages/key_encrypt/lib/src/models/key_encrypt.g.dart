// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_encrypt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AESDataModel _$AESDataModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AESDataModel',
      json,
      ($checkedConvert) {
        final val = AESDataModel(
          ciphertext: $checkedConvert(
            'ciphertext',
            (v) =>
                (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
          ),
          NMMvCS: $checkedConvert(
            'n_m_mv_c_s',
            (v) =>
                (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
          ),
          finalList: $checkedConvert(
            'final_list',
            (v) =>
                (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
          ),
          error: $checkedConvert('error', (v) => v as String?),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'NMMvCS': 'n_m_mv_c_s',
        'finalList': 'final_list',
        'ownerId': 'owner_id',
      },
    );

Map<String, dynamic> _$AESDataModelToJson(AESDataModel instance) =>
    <String, dynamic>{
      'owner_id': instance.ownerId,
      'ciphertext': instance.ciphertext,
      'n_m_mv_c_s': instance.NMMvCS,
      'final_list': instance.finalList,
      'error': instance.error,
    };
