AX  16비트
AH AL
sreg
레지스터 다 외워야 한
메모리 메모리는 안된다
인스트럭션 포인트 레지스터는 다음에 실행할 주소를 저장하는 거

l이 로우 h가 하이
eax  
eax로 추가 ax
무브 제로엑스 movzx는 안같아도 가능
movsx는 최상위 비트로 왼쪽을 가득 채운다
어셈블리에서 L은 로드, s는 store 
플래그 레지스터
LAHF AH의 플래그 레지스터를 로드 SAHF 스토어  
XCHG 익스체인지
notebooklm
xchg var1,var2하면 안됨 메모리메모리라
mov ax, var1같은 식으로 해결
INC랑 ADD가 있다
neg 2의 보수
a++ a+=1
적은 수에서 큰수를 빼면 CF carry 플래그가 발생한다
carry 플래그는 최상위비트에서 캐리되면 발생
00001111에서
00010000이 되어도 발생함
Parity flag 1의 개수가 짝수면 1 홀수면 0
 Sign flag 최상위 비트가 0이면 0 1이면 1
 Overflow flag 넘치면 1 바닥을 뚫어도 1
 al은 -128에 neg ax는 3만머시기
d는 더블
q는 쿼드
[]는 주소
inc에 얼마나 늘릴지도 써야한다
ECX 루프의 카운터
루프는 자동으로 cx에 숫자를넣어서 반복한다


 예제들은 한 번씩 디버깅해보자
