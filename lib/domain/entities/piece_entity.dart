import 'package:flutter/material.dart';

class Piece {
  final List<Piece> leftPieces = [];
  final List<Piece> upPieces = [];
  final List<Piece> rightPieces = [];
  final List<Piece> downPieces = [];

  Color color;
  Pos position;

  Piece({required this.position, this.color = Colors.red});
}

class Pos {
  int column;
  int row;

  Pos({required this.row, required this.column});
}

final Piece pieceNotFound = Piece(position: Pos(row: -111111, column: -111111));
