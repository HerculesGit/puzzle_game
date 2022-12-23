import 'jump_direction.dart';

class LeftJumpDirection implements JumpDirection {
  @override
  int jumpToColumn() => -1;

  @override
  int jumpToRow() => 0;
}
