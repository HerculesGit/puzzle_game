import '../entities/piece_entity.dart';

class SearchLeftUseCase {
  List<Piece> call({
    required List<Piece> nextPieces,
    required List<Piece> puzzleTable,
    required Piece currentPiece,
  }) {
    final Piece nextPiece =
        _getNextPosition(puzzleTable: puzzleTable, currentPiece: currentPiece);

    if (nextPiece != pieceNotFound && nextPiece.color == currentPiece.color) {
      nextPieces.add(nextPiece);
      call(
          nextPieces: nextPieces,
          currentPiece: nextPiece,
          puzzleTable: puzzleTable);
    }

    return nextPieces;
  }

  Piece _getNextPosition(
      {required List<Piece> puzzleTable, required Piece currentPiece}) {
    final int column = currentPiece.position.column - 1;
    final int row = currentPiece.position.row;

    final Pos nextPosition = Pos(row: row, column: column);

    final Piece nextPiece = puzzleTable.firstWhere(
        (p) =>
            (p.position.row == nextPosition.row) && p.position.column == column,
        orElse: () => pieceNotFound);
    return nextPiece;
  }
}
