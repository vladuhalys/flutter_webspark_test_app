import 'dart:math';

import 'package:flutter_webspark_test_app/feature/data/models/path_model.dart';

class PathEntity {
  final String id;
  final Point start;
  final Point end;
  final List<Point> block;
  final String initPath;
  late String finalPath = '';
  late List<Point> path = [];
  final List<List<int>> grid;
  final List<Point> allPoints;
  final int cols;
  final int rows;

  PathEntity(
      {required this.id,
      required this.start,
      required this.end,
      required this.block,
      required this.grid,
      required this.initPath,
      required this.allPoints,
      required this.cols,
      required this.rows});

  factory PathEntity.fromModel(PathModel model) {
    return PathEntity(
      id: model.id,
      start: model.start,
      end: model.end,
      block: getBlockPointsFromStringList(model.field),
      grid: getGrid(model.field),
      initPath: getInitPath(model.start, model.end),
      allPoints: model.allPoints,
      cols: model.cols,
      rows: model.rows,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': {
        'steps': path.map((point) => {'x': point.x, 'y': point.y}).toList(),
        'path': getFinalPath(this),
      },
    };
  }
}

String getInitPath(Point start, Point end) {
  return '(${start.x}, ${start.y}) -> (${end.x}, ${end.y})';
}

String getJsonFromPathEntity(List<Point> path) {
  String json = '';
  for (int i = 0; i < path.length; i++) {
    json += '{"x": ${path[i].x}, "y": ${path[i].y}}';
    if (i != path.length - 1) {
      json += ',';
    }
  }
  return json;
}

String getFinalPath(PathEntity pathEntity) {
  String finalPath = '"';
  var path = pathEntity.path;
  path = path.reversed.toList();
  for (int i = 0; i < pathEntity.path.length; i++) {
    finalPath += '(${pathEntity.path[i].x}, ${pathEntity.path[i].y})';
    if (i != pathEntity.path.length - 1) {
      finalPath += ' -> ';
    }
  }
  finalPath += '"';
  return finalPath;
}

List<List<int>> getGrid(List<String> list) {
  int rows = list.length;
  int cols = list[0].length;
  List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, 0));
  return grid;
}

List<Point> getBlockPointsFromStringList(List<String> list) {
  List<Point> tempblock = [];
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i].length; j++) {
      if (list[i][j] == 'X') {
        tempblock.add(Point(i, j));
      }
    }
  }
  return tempblock;
}
