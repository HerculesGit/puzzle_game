import 'package:puzzle_game/domain/entities/piece_entity.dart';

import 'factory/jump_direction.dart';

/// horizontal and vertical
class FindPiecesUseCase {
  List<Piece> call({
    required List<Piece> nextPieces,
    required List<Piece> puzzleTable,
    required JumpDirection jumpDirection,
    required Piece currentPiece,
  }) {
    final Piece nextPiece = _getNextPosition(
        puzzleTable: puzzleTable,
        currentPiece: currentPiece,
        jumpDirection: jumpDirection);

    if (nextPiece != pieceNotFound && nextPiece.color == currentPiece.color) {
      nextPieces.add(nextPiece);
      call(
          nextPieces: nextPieces,
          currentPiece: nextPiece,
          jumpDirection: jumpDirection,
          puzzleTable: puzzleTable);
    }

    return nextPieces;
  }

  Piece _getNextPosition(
      {required List<Piece> puzzleTable,
      required Piece currentPiece,
      required JumpDirection jumpDirection}) {
    int column = currentPiece.position.column + jumpDirection.jumpToColumn();
    int row = currentPiece.position.row + jumpDirection.jumpToRow();

    final Pos nextPosition = Pos(row: row, column: column);

    final Piece nextPiece = puzzleTable.firstWhere(
        (p) =>
            (p.position.row == nextPosition.row) && p.position.column == column,
        orElse: () => pieceNotFound);
    return nextPiece;
  }
}
