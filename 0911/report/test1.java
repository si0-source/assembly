package assem;
import java.util.*;
public class test1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String n = sc.nextLine();
        int sum=0;
        for (int i=0;i<16;i++){
            char c = n.charAt(i);
            sum=sum*2+(c-'0');
        }
        System.out.println(sum);
    }
}
