ESI EDI 
AL, AX, or EAX a는 accumulator의 줄임말

movsb 무브에 스트링 바이트
cmpsb  EDI
scasb 스캔 EDI
stosb 스토어 EDI
lodsb 로드 ESI
cld 디렉션 플래그 클린 방향을 결정하는 플래그

rep 리피트 movsb같은 걸로 b단위로 반복
cld 문자열 이동시킬때 클리어하거나 set해야한다 
std 디렛션 플래그 set하는 명령어
repe 리피트 equal
repne scasb 같지않으면 반복 채우는 반복 
메모리에 저장은 store 불러오기가 load 
trim 특정 문자를 지울 수 있다
Two-Dimensional Arrays row major  column major 대부분 row major ordering를 쓰지만 그렇다고 column이 불가능한 것은 아니고 있기는 하다.
base index displacement displacement[base+index]
