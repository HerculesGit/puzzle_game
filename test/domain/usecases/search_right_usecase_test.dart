import 'package:flutter/material.dart';
import 'package:puzzle_game/domain/entities/piece_entity.dart';
import 'package:puzzle_game/domain/usecases/search_right_usecase.dart';
import 'package:test/test.dart';

List<Piece> puzzleTable = [
  /// row 1
  Piece(position: Pos(row: 1, column: 1), color: Colors.purple),
  Piece(position: Pos(row: 1, column: 2), color: Colors.yellow),
  Piece(position: Pos(row: 1, column: 3), color: Colors.green),
  Piece(position: Pos(row: 1, column: 4), color: Colors.yellow),
  Piece(position: Pos(row: 1, column: 5), color: Colors.yellow),

  /// row 2
  Piece(position: Pos(row: 2, column: 1), color: Colors.purple),
  Piece(position: Pos(row: 2, column: 2), color: Colors.yellow),
  Piece(position: Pos(row: 2, column: 3), color: Colors.blue),
  Piece(position: Pos(row: 2, column: 4), color: Colors.blue),
  Piece(position: Pos(row: 2, column: 5), color: Colors.blue),
];

void main() {
  test('should found 2 right piece with blue color', () {
    final sut = SearchRightUseCase();

    final currentPosition = Pos(row: 2, column: 3);
    Piece currentPiece = Piece(position: currentPosition, color: Colors.blue);

    sut(
        nextPieces: currentPiece.rightPieces,
        currentPiece: currentPiece,
        puzzleTable: puzzleTable);

    expect(currentPiece.rightPieces.length, 2);
  });
}
