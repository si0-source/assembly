package assem;
import java.util.*;
public class test4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        int value = num;

        while (value > 0) {
            int digit = value % 16;
            char hexChar;

            if (digit < 10) hexChar = (char) ('0' + digit);
            else hexChar = (char) ('A' + (digit - 10));

            sb.append(hexChar);
            value /= 16;
        }
        String a= sb.reverse().toString();
        System.out.println(a);
    }
}
