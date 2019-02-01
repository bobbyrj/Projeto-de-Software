package Object;

import java.util.Set;
import java.util.TreeSet;

public class main {
	public static void main (String args[] ){
		int i = 9;
		int z = 8;
		
		Set<Integer> teste = new TreeSet<Integer>();
		teste.add(i);
		teste.add(z);
		
		System.out.println(teste.contains(i));
		
	}
}
