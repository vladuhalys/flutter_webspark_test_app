import 'dart:math';

class PathModel {
  final String id;
  final Point start;
  final Point end;
  final List<String> field;
  final List<Point> allPoints;
  final int cols;
  final int rows;

  PathModel(
      {required this.id,
      required this.start,
      required this.end,
      required this.field,
      required this.allPoints,
      required this.cols,
      required this.rows});

  factory PathModel.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString();
    Point start = Point(json['start']['x'] as int, json['start']['y'] as int);
    Point end = Point(json['end']['x'] as int, json['end']['y'] as int);
    List<String> field =
        (json['field'] as List).map((e) => e.toString()).toList();
    List<Point> allPoints = [];
    int cols = field.length;
    int rows = field[0].length;
    for (int i = 0; i < field.length; i++) {
      for (int j = 0; j < field[i].length; j++) {
        allPoints.add(Point(i, j));
      }
    }
    return PathModel(
      id: id.toString(),
      start: start,
      end: end,
      field: field,
      allPoints: allPoints,
      cols: cols,
      rows: rows,
    );
  }
}
