package assem;
import java.util.*;
public class test6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String num1 = sc.next();
        String num2 = sc.next();
        StringBuilder result = new StringBuilder();
        int carry = 0;

        int i = num1.length() - 1;
        int j = num2.length() - 1;

        while (i >= 0 || j >= 0 || carry != 0) {
            int digit1 = (i >= 0) ? Character.digit(num1.charAt(i--), 16) : 0;
            int digit2 = (j >= 0) ? Character.digit(num2.charAt(j--), 16) : 0;

            int sum = digit1 + digit2 + carry;
            result.append(Integer.toHexString(sum % 16).toUpperCase());
            carry = sum / 16;
        }

        String a = result.reverse().toString();
        System.out.println(a);
    }
}
