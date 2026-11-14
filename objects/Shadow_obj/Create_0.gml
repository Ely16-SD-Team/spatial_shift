enum SimpleStates {
    IDLE,
    WALK
}

current_state = SimpleStates.IDLE;
MoveSpeed = 2;
PlayerDir = 1;

function ChangeToIdle() {
    current_state = SimpleStates.IDLE;
}
