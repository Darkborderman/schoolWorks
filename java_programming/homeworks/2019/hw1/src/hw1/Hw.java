package hw1;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Hw {
	public static void main(String[] args) {
		for (String item : args) {
			item = item.toLowerCase();
			if (!vowel.contains(item.charAt(0))) {
				item = (item + item.charAt(0)).substring(1);
			}
			item = item.substring(0, 1).toUpperCase() + item.substring(1) + "ay";
			System.out.print(item + ' ');
		}
	}

	private static Set<Character> vowel = new HashSet<>(Arrays.asList('a', 'e', 'i', 'o', 'u'));
}
