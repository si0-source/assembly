인터렉트 int
<< >> >>>시프트
SH시프트 한칸씩 밀기
SHL 시프트 래프트
SAL arithmetic shift
로테이트 
ROL 로테이트 래프트
RCL c=캐리
SHLD d=더블
logical shift 하나씩밀고 빈자리를 0으로 채운다 캐리 플래그에 최하위 비트가 들어감
arithmetic shift 하나씩 밀고 빈공간을 최상위 비트로 채운다 
sh를 이용한 곱셈이 그냥 곱셈보다 휠씬 빠르다
sh쓰다가 최상위비트가 1인상태에서 쓰면 결과가 터진다
shift arithmetic left는 shl과 똑같다
sar 부호는 유지하는 나누기 shr 부호도 민다
rotate 암호화 복호화 여러 곳에 쓰인다
rotate carry빈공간에 캐리 플래그에 있는 비트가 들어간다 
SHLD 에 Sign, Zero,
Auxiliary, Parity, and Carry가 영향받는다
SHLD 빈공간에 다른 곳에서 비트를 가져와 채운
mul곱
IMUL Overflow and Carry flags
CBW convert byte to word CWD convert word to byte CDQ
SBB 캐리플래그도 빼기에 동참
DAA 
