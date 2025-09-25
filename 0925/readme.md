main PROC
어셈블리의 메인 
eax
레지스터 이거 c언어에서도 다룰 수 있다
move eax, 5 5를 eax에 넣어라
add eax, 6 5+6 eax에 11이 저장된
INVOKE Exit Process, 0 

shell이 디스키에 있는 파일을 주기억장치로 옮겨서 실행 저 0은 쉘한테 보내는 거  
쉘에서 0은 success 성공을 의미 0이 아니면 오류로 인식  

sum DRWORD 0
int sum=0
모든 함수 메모리는 스택을 사용한다
.data .code .stack 어셈블리 스켈레톤 이 3개는 꼭 있어야한다
코드 레이블점프할 때 사용한다 jmp 점프의 줄임 
nop은 pass같은 명령
c컴파일이랑 매우 비슷하
