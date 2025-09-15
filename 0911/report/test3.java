package assem;
import java.util.*;
public class test3 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        StringBuilder sb = new StringBuilder();
        while (num>0) {
            sb.append(num%2);
            num =num/ 2;
        }
        String a= sb.reverse().toString();
        System.out.println(a);
    }
}
