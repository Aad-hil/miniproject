package com.taxapp.login;

import java.util.Scanner;

public class LoginSystem {
    // Hardcoded credentials (can be extended later)
    private static final String VALID_USERNAME = "admin";
    private static final String VALID_PASSWORD = "password123";

    public static boolean authenticate() {
        Scanner scanner = new Scanner(System.in);
        boolean isAuthenticated = false;

        System.out.println("=== Tax Calculation Application Login ===");

        // Allow 3 attempts
        for (int attempt = 1; attempt <= 3; attempt++) {
            System.out.print("Enter Username: ");
            String username = scanner.nextLine();

            System.out.print("Enter Password: ");
            String password = scanner.nextLine();

            if (username.equalsIgnoreCase(VALID_USERNAME) && password.equals(VALID_PASSWORD)) {
                isAuthenticated = true;
                break;
            } else {
                System.out.println("Invalid credentials. Attempt " + attempt + " of 3.");
            }
        }

        if (isAuthenticated) {
            System.out.println("\nLogin Successful ✅");
            System.out.println("Welcome to the Tax Calculation Application!");
        } else {
            System.out.println("\nLogin Failed ❌. Exiting application...");
            System.exit(0); // terminate if login fails
        }

        return isAuthenticated;
    }
}
