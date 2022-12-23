import 'jump_direction.dart';

class RightJumpDirection implements JumpDirection {
  @override
  int jumpToColumn() => 1;

  @override
  int jumpToRow() => 0;
}
