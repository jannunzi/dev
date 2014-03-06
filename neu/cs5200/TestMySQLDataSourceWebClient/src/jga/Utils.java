package jga;

public class Utils {
	public static int parseInt(String text) {
		try {
			return new Integer(text);
		} catch (NumberFormatException e) {
			return 0;
		}
	}
}
