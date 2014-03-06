package jga;

public class Utils {
	public static int parseInt(String text) {
		try {
			return new Integer(text);
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	public static float parseFloat(String text) {
		try {
			return new Float(text);
		} catch (NumberFormatException e) {
			return 0.0f;
		}
	}
}
