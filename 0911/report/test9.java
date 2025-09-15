package assem;
import java.util.*;
public class test9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String num1 = sc.next();
        String num2 = sc.next();
        int[] num3 = new int[8];
        for (int i = 0; i < 8; i++) {
            char bit = num2.charAt(i);
            if (bit == '1') {
                num3[i] = 0;
            } else if (bit == '0') {
                num3[i] = 1;
            }

        }
        for (int j=7;j>=0;j--){
            if (num3[j]==0){
                num3[j]=1;
                break;
            }
            else if (num3[j]==1){
                num3[j]=0;
        }
    }
        for (int k=0;k<8;k++)
            System.out.print(num3[k]);
}
}
//아 잠만 이거 2의 보수를 하고 더해야하는데 2의 보수만 하고 출력되게 해뒀네 나중에 고치자