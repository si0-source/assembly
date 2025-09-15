package assem;
import java.util.*;
public class test7 {


    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        char num1 = sc.next().charAt(0);
        String num2 = sc.next();
        int multiplier = Character.digit(num1, 16);
        StringBuilder result = new StringBuilder();
        int carry = 0;

        for (int i = num2.length() - 1; i >= 0; i--) {
            int digit = Character.digit(num2.charAt(i), 16);
            int product = digit * multiplier + carry;

            result.append(Integer.toHexString(product % 16).toUpperCase());
            carry = product / 16;
        }

        if (carry > 0) {
            result.append(Integer.toHexString(carry).toUpperCase());
        }

        String a= result.reverse().toString();
        System.out.println(a);
    }
}
