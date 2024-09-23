import 'dart:convert';

import 'package:hostel/domain/rooms_availability/entity/block_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BlockModel {
  String blockId;
  String blockName;
  BlockModel({
    required this.blockId,
    required this.blockName,
  });

  factory BlockModel.fromJson(String source) =>
      BlockModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory BlockModel.fromMap(Map<String, dynamic> map) {
    return BlockModel(
      blockId: map['blockId'] as String,
      blockName: map['blockName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'blockId': blockId,
      'blockName': blockName,
    };
  }
}

extension BlockXModel on BlockModel {
  BlockEntity toEntity() {
    return BlockEntity(
      blockId: blockId,
      blockName: blockName,
    );
  }
}
