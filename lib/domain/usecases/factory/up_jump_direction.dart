import 'jump_direction.dart';

class UpJumpDirection implements JumpDirection {
  @override
  int jumpToColumn() => 0;

  @override
  int jumpToRow() => -1;
}
