package assem;
import java.util.*;
public class test2 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        String n = sc.nextLine();
        long result=0;
        for (int i = 0; i < n.length(); i++){
            char c = n.charAt(i);
            int num=0;
            if (c >= '0' && c <= '9') num = c - '0';
            else if (c >= 'A' && c <= 'F') num = c - 'A' + 10;
            else if (c >= 'a' && c <= 'f') num = c - 'a' + 10;
            result = (result*16) + num;
        }
    System.out.println(result);
    }
}
