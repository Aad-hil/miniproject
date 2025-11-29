package com.taxapp.ui;

public class MenuHandler {

    // Handle menu choice from WelcomeScreen
    public static void handleChoice(int choice) {
        switch (choice) {
            case 1:
                System.out.println("\n--- Property Module Selected ---");
                // TODO: Call PropertyService.addProperty()
                break;

            case 2:
                System.out.println("\n--- Vehicle Module Selected ---");
                // TODO: Call VehicleService.addVehicle()
                break;

            case 3:
                System.out.println("\n--- Tax Summary Module Selected ---");
                // TODO: Call TaxCalculator.displaySummary()
                break;

            case 4:
                System.out.println("\nClosing Application... Goodbye!");
                break;

            default:
                System.out.println("Invalid choice. Please enter 1–4.");
        }
    }
}
