package com.taxapp;

import com.taxapp.login.LoginSystem;
import com.taxapp.ui.WelcomeScreen;

public class Main {
    public static void main(String[] args) {
		// Step 1: Authenticate user
        if (LoginSystem.authenticate()) {
            // Step 2: Show Welcome Screen (next task)
            
        	WelcomeScreen.display();
        }
    }
}
