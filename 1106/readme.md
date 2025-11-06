and는 특정위치의 비트를 구하는데 사용할 수 있다.
1000 0000
1111 1111을 and하면 최상위 비트가 뭔지 정확히 알 수 있다
대문자 소문자 변환
1101 1111을 and하면 소문자를대문자로 쉽게 바꿀수 있다
or에서 carry overflow 플래그는 클리어된다
(x or y) or y = x
(x or y) or x = y
test와 and의 차이는 테스트는 destination operand이 변경되지않는 것 플래그는 변동
stc set carry flag
clc clear carry flag
jz 점프 제로플래그=1
jnz 점프 낫 제로플래그=0
je 이퀼 =
jl less 적으면
jg greater 크면
컴페어 메소드는 리턴 값이 3가지다 음수 0 양수
JCXZ CX=0이라면
JA above
