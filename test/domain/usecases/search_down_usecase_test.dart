import 'package:flutter/material.dart';
import 'package:puzzle_game/domain/entities/piece_entity.dart';
import 'package:puzzle_game/domain/usecases/factory/down_jump_direction.dart';
import 'package:puzzle_game/domain/usecases/factory/jump_direction.dart';
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

  /// row 3
  Piece(position: Pos(row: 3, column: 2), color: Colors.blue),
  Piece(position: Pos(row: 3, column: 5), color: Colors.blue),

  /// row 4
  Piece(position: Pos(row: 4, column: 2), color: Colors.blue),

  /// row 5
  Piece(position: Pos(row: 5, column: 2), color: Colors.blue),
];

void main() {
  late FindPiecesUseCase sut;
  late JumpDirection jumpDirection;

  setUp(() {
    sut = FindPiecesUseCase();
    jumpDirection = DownJumpDirection();
  });

  test('should found 0 left piece', () {
    Piece purplePiece =
        Piece(position: Pos(row: 2, column: 1), color: Colors.purple);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: purplePiece.downPieces,
        currentPiece: purplePiece,
        puzzleTable: puzzleTable);

    expect(purplePiece.leftPieces.length, 0);
    expect(purplePiece.upPieces.length, 0);
    expect(purplePiece.rightPieces.length, 0);
    expect(purplePiece.downPieces.length, 0);

    Piece yellowPiece =
        Piece(position: Pos(row: 2, column: 2), color: Colors.yellow);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: yellowPiece.downPieces,
        currentPiece: yellowPiece,
        puzzleTable: puzzleTable);

    expect(yellowPiece.leftPieces.length, 0);
    expect(yellowPiece.upPieces.length, 0);
    expect(yellowPiece.rightPieces.length, 0);
    expect(yellowPiece.downPieces.length, 0);

    Piece greenPiece =
        Piece(position: Pos(row: 1, column: 3), color: Colors.green);

    expect(greenPiece.leftPieces.length, 0);
    expect(greenPiece.upPieces.length, 0);
    expect(greenPiece.rightPieces.length, 0);
    expect(greenPiece.downPieces.length, 0);

    yellowPiece = Piece(position: Pos(row: 1, column: 4), color: Colors.yellow);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: yellowPiece.leftPieces,
        currentPiece: yellowPiece,
        puzzleTable: puzzleTable);

    expect(yellowPiece.leftPieces.length, 0);
    expect(yellowPiece.upPieces.length, 0);
    expect(yellowPiece.rightPieces.length, 0);
    expect(yellowPiece.downPieces.length, 0);

    var bluePiece = Piece(position: Pos(row: 2, column: 4), color: Colors.blue);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: bluePiece.leftPieces,
        currentPiece: bluePiece,
        puzzleTable: puzzleTable);

    expect(bluePiece.leftPieces.length, 0);
    expect(bluePiece.upPieces.length, 0);
    expect(bluePiece.rightPieces.length, 0);
    expect(bluePiece.downPieces.length, 0);
  });

  test('should found 1 right piece', () {
    var yellowPiece =
        Piece(position: Pos(row: 1, column: 2), color: Colors.yellow);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: yellowPiece.downPieces,
        currentPiece: yellowPiece,
        puzzleTable: puzzleTable);

    expect(yellowPiece.leftPieces.length, 0);
    expect(yellowPiece.upPieces.length, 0);
    expect(yellowPiece.rightPieces.length, 0);
    expect(yellowPiece.downPieces.length, 1);

    var bluePiece = Piece(position: Pos(row: 2, column: 5), color: Colors.blue);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: bluePiece.downPieces,
        currentPiece: bluePiece,
        puzzleTable: puzzleTable);

    expect(bluePiece.leftPieces.length, 0);
    expect(bluePiece.upPieces.length, 0);
    expect(bluePiece.rightPieces.length, 0);
    expect(bluePiece.downPieces.length, 1);
  });

  test('should found 2 right piece', () {
    var bluePiece = Piece(position: Pos(row: 3, column: 2), color: Colors.blue);

    sut(
        jumpDirection: jumpDirection,
        nextPieces: bluePiece.downPieces,
        currentPiece: bluePiece,
        puzzleTable: puzzleTable);

    expect(bluePiece.leftPieces.length, 0);
    expect(bluePiece.upPieces.length, 0);
    expect(bluePiece.rightPieces.length, 0);
    expect(bluePiece.downPieces.length, 2);
  });
}
