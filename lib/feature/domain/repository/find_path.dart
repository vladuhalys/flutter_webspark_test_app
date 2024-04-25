import 'dart:collection';
import 'dart:math';
import 'package:flutter_webspark_test_app/feature/domain/entities/path_entity.dart';

class Node {
  final num x;
  final num y;
  Node? parent;
  final num gCost;
  final num hCost;
  final num fCost;
  Node(this.x, this.y, this.parent, this.gCost, this.hCost, this.fCost);
}

List<Node> findPath(
    List<List<int>> grid, Node start, Node end, List<List<int>> blockPoints) {
  final openSet = HashSet<Node>();
  final closedSet = HashSet<Node>();

  openSet.add(start);

  while (openSet.isNotEmpty) {
    Node current = openSet.first;
    for (Node node in openSet) {
      if (node.fCost < current.fCost) {
        current = node;
      }
    }

    if (current.x == end.x && current.y == end.y) {
      return retracePath(current);
    }

    openSet.remove(current);
    closedSet.add(current);

    for (int dx in [-1, 0, 1]) {
      for (int dy in [-1, 0, 1]) {
        if (dx == 0 && dy == 0) continue;

        num newX = current.x + dx;
        num newY = current.y + dy;

        if (newX < 0 ||
            newX >= grid.length ||
            newY < 0 ||
            newY >= grid[0].length) continue;

        if (blockPoints.any((point) => point[0] == newX && point[1] == newY)) {
          continue;
        }
        Node neighbor = Node(
            newX,
            newY,
            current,
            current.gCost + 1,
            calculateHCost(newX, newY, end),
            current.gCost + 1 + calculateHCost(newX, newY, end));

        if (closedSet.contains(neighbor)) continue;

        bool betterGCost = openSet
            .any((node) => node == neighbor && node.gCost < neighbor.gCost);
        if (!openSet.contains(neighbor) || betterGCost) {
          neighbor.parent = current;
          openSet.add(neighbor);
        }
      }
    }
  }
  return [];
}

num calculateHCost(num x, num y, Node end) {
  return (x - end.x).abs() + (y - end.y).abs();
}

List<Node> retracePath(Node node) {
  List<Node> path = [];
  Node? current = node;

  while (current != null) {
    path.add(current);
    current = current.parent;
  }

  return path.reversed.toList();
}

List<Point> getPathPoints(PathEntity pathEntity) {
  List<List<int>> grid = pathEntity.grid;

  Node start =
      Node(pathEntity.start.x, pathEntity.start.y, null, 0.0, 0.0, 0.0);
  Node end = Node(pathEntity.end.x, pathEntity.end.y, null, 0.0, 0.0, 0.0);

  List<List<int>> blockPoints = [];
  for (Point point in pathEntity.block) {
    blockPoints.add([point.x.toInt(), point.y.toInt()]);
  }
  List<Node> path = findPath(grid, start, end, blockPoints);

  List<Point> points = [];
  for (Node node in path) {
    points.add(Point(node.x.toInt(), node.y.toInt()));
  }
  return points;
}

// void main() {
//   // Приклад використання
//   int rows = 6;
//   int cols = 6;
//   List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, 0));

//   Node start = Node(1, 0, null, 0.0, 0.0, 0.0);
//   Node end = Node(4, 4, null, 0.0, 0.0, 0.0);
//   List<List<int>> blockPoints = [
//     [2, 2],
//     [3, 2],
//     [4, 2]
//   ];

//   List<Node> path = findPath(grid, start, end, blockPoints);

//   if (path.isEmpty) {
//     print("Шлях не знайдено.");
//   } else {
//     print("Шлях:");
//     for (Node node in path) {
//       print("(${node.x}, ${node.y})");
//     }
//   }
// }
