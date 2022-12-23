import 'package:flutter/material.dart';
import 'package:puzzle_game/domain/entities/piece_entity.dart';
import 'package:puzzle_game/domain/usecases/factory/jump_direction.dart';
import 'package:puzzle_game/domain/usecases/factory/right_jump_direction.dart';
import 'package:puzzle_game/domain/usecases/find_pieces_usecase.dart';
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
  late FindPiecesUseCase sut;
  late JumpDirection jumpDirection;

  setUp(() {
    sut = FindPiecesUseCase();
    jumpDirection = RightJumpDirection();
  });

  test('should found 2 right piece with blue color', () {
    final currentPosition = Pos(row: 2, column: 3);
    Piece currentPiece = Piece(position: currentPosition, color: Colors.blue);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: currentPiece.rightPieces,
        currentPiece: currentPiece,
        puzzleTable: puzzleTable);

    expect(currentPiece.rightPieces.length, 2);
    expect(currentPiece.downPieces.length, 0);
    expect(currentPiece.leftPieces.length, 0);
    expect(currentPiece.upPieces.length, 0);
  });

  test('should found 1 right piece with yellow color', () {
    final currentPosition = Pos(row: 1, column: 4);
    Piece currentPiece = Piece(position: currentPosition, color: Colors.yellow);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: currentPiece.rightPieces,
        currentPiece: currentPiece,
        puzzleTable: puzzleTable);

    expect(currentPiece.rightPieces.length, 1);
    expect(currentPiece.downPieces.length, 0);
    expect(currentPiece.leftPieces.length, 0);
    expect(currentPiece.upPieces.length, 0);
  });

  test('should found 0 right piece with yellow color', () {
    final currentPosition = Pos(row: 1, column: 3);
    Piece currentPiece = Piece(position: currentPosition, color: Colors.green);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: currentPiece.rightPieces,
        currentPiece: currentPiece,
        puzzleTable: puzzleTable);

    expect(currentPiece.rightPieces.length, 0);
    expect(currentPiece.downPieces.length, 0);
    expect(currentPiece.leftPieces.length, 0);
    expect(currentPiece.upPieces.length, 0);
  });
}
