.include "test_framework.s"

start_tests

__CATEGORY__ ; tests for A
__CASE__ ; First case
lda #3
TEST_a_eq_literal 3
lda #25
TEST_a_eq_literal 25

__CASE__ ; Higher numbers, wow
lda #123
TEST_a_eq_literal 123

end_tests
