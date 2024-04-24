import 'package:equatable/equatable.dart';

class PointEntity extends Equatable {
  final int x;
  final int y;

  const PointEntity(this.x, this.y);

  @override
  String toString() {
    return '($x, $y)';
  }

  @override
  List<Object?> get props => [x, y];

  factory PointEntity.fromJson(Map<String, dynamic> json) {
    return PointEntity(
      json['x'] as int,
      json['y'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
    };
  }
}
