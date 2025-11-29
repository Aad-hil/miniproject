package com.taxapp.ui;

import java.util.Scanner;

public class WelcomeScreen {

    public static void display() {
        Scanner scanner = new Scanner(System.in);
        int choice = -1;

        // Display welcome information
        System.out.println("\n========================================");
        System.out.println("   TAX CALCULATION APPLICATION");
        System.out.println("   Developed by: Your Name Here");
        System.out.println("========================================");
        System.out.println("User Interface Information:");
        System.out.println(" - Enter numeric choices to navigate.");
        System.out.println(" - Follow prompts to input property/vehicle details.");
        System.out.println(" - Calculations will be shown in tabular format.");
        System.out.println("========================================");

        // Menu loop
        while (choice != 4) {
            System.out.println("\nPlease select an option:");
            System.out.println("1. Add Property & Calculate Tax");
            System.out.println("2. Add Vehicle & Calculate Tax");
            System.out.println("3. View Tax Summary");
            System.out.println("4. Exit Application");
            System.out.print("Enter your choice: ");

            // Validate numeric input
            if (scanner.hasNextInt()) {
                choice = scanner.nextInt();
                scanner.nextLine(); // consume newline

                // Delegate to MenuHandler
                MenuHandler.handleChoice(choice);

                // Exit loop if user chooses 4
                if (choice == 4) {
                    break;
                }

            } else {
                System.out.println("Invalid input. Please enter a number between 1–4.");
                scanner.nextLine(); // clear invalid input
            }
        }

        // Close scanner before exiting
        scanner.close();
    }
}
