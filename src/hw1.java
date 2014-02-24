/*
 * Aleksander Eskilson, aeskilso@ku.edu
 * 2373732
 * hw1
 */
import java.util.InputMismatchException;
import java.util.Scanner;

public class hw1 {
	public static void main(String[] args) {
		Scanner kb = new Scanner(System.in);
		int number = -1;
		int guess = -1;
		
		do {
			try {
				System.out.println("Please provide an integer between 1 and 10 inclusive:");
				number = kb.nextInt();
			} catch (InputMismatchException err) {
				System.out.println("Error, provide an integer.");
				kb.nextLine();
			}
		} while (number <= 1 || number >= 10);
		
		boolean guessedRight = false;
		do {
			try {
				System.out.println("Guess an integer number between 1 and 10 inclusive:");
				guess = kb.nextInt();
			} catch (InputMismatchException err) {
				System.out.println("Error, guess an integer.");
				kb.nextLine();
				continue;
			}
			if (guess == number)
				guessedRight = true;
			else if (guess > number)
				System.out.println("Your guess is too high.");
			else
				System.out.println("Your guess is too low.");
		} while (!guessedRight);
		System.out.println(number);
		
		System.out.println("You have guessed the number and you win a cookie. Felicitous congratulations.");
		kb.close();
	}
}