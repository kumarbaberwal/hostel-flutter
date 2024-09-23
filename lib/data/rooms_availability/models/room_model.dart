import 'dart:convert';

import 'package:hostel/domain/rooms_availability/entity/room_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RoomModel {
  String blockId;
  int currentCapacity;
  int roomCharges;
  String roomId;
  int roomNumber;
  String roomStatus;
  String roomType;
  int totalCapacity;
  RoomModel({
    required this.blockId,
    required this.currentCapacity,
    required this.roomCharges,
    required this.roomId,
    required this.roomNumber,
    required this.roomStatus,
    required this.roomType,
    required this.totalCapacity,
  });

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      blockId: map['blockId'] as String,
      currentCapacity: map['currentCapacity'] as int,
      roomCharges: map['roomCharges'] as int,
      roomId: map['roomId'] as String,
      roomNumber: map['roomNumber'] as int,
      roomStatus: map['roomStatus'] as String,
      roomType: map['roomType'] as String,
      totalCapacity: map['totalCapacity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'blockId': blockId,
      'currentCapacity': currentCapacity,
      'roomCharges': roomCharges,
      'roomId': roomId,
      'roomNumber': roomNumber,
      'roomStatus': roomStatus,
      'roomType': roomType,
      'totalCapacity': totalCapacity,
    };
  }
}

extension RoomXModel on RoomModel {
  RoomEntity toEntity() {
    return RoomEntity(
      blockId: blockId,
      currentCapacity: currentCapacity,
      roomCharges: roomCharges,
      roomId: roomId,
      roomNumber: roomNumber,
      roomStatus: roomStatus,
      roomType: roomType,
      totalCapacity: totalCapacity,
    );
  }
}
