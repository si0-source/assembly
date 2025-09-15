package assem;

public class test8 {
    public static void main(String[] args) {
        int Y = 0;
        int X = (Y + 4) * 3;
        System.out.println(X);
    }
}
Compiled from "test8.java"
public class assem.test8 { //이게 package
  public assem.test8();
    Code:
    0: aload_0
    1: invokespecial #1                  // Method java/lang/Object."<init>":()V
    4: return

    public static void main(java.lang.String[]);
    Code:
    0: iconst_0 //0넣기
    1: istore_1 //저장
    2: iload_1 //저장불러오기
    3: iconst_4 //4저장
    4: iadd //더하기
    5: iconst_3 //3저장
    6: imul //곱하기
    7: istore_2 //곱한 값을 저장
    8: getstatic     #7                  // Field java/lang/System.out:Ljava/io/PrintStream;
    11: iload_2 //곱한 값 불러오기
    12: invokevirtual #13 //print                // Method java/io/PrintStream.println:(I)V
    15: return //끝
}