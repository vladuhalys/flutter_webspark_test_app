import 'package:equatable/equatable.dart';

class Point extends Equatable {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  List<Object?> get props => [x, y];

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
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


