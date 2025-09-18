Feature: User Login and Redirection to Pump Pairing Flow

  # Positive Scenarios
  Scenario: Successful login with valid email and password
    Given the user is on the Login screen
    When the user clicks on the "Login" button
    And the user enters a valid email into the email field
    And the user clicks on the "Next" button
    And the user enters a valid password into the password field
    And the user clicks on the "Login" button
    Then the user should be redirected to the "Allow Notification" or "Begin Pump Pairing" screen

  Scenario: Login with valid email and password but choosing "Allow Notification"
    Given the user is on the Login screen
    When the user completes login with valid credentials
    And the user chooses "Allow Notification"
    Then the user should be redirected to the "Begin Pump Pairing" screen

  Scenario: Login with valid email and password but skipping notification permission
    Given the user is on the Login screen
    When the user completes login with valid credentials
    And the user denies notification permission
    Then the user should still be redirected to the "Begin Pump Pairing" screen

  # Negative Scenarios
  Scenario: Login with invalid email format
    Given the user is on the Login screen
    When the user clicks on the "Login" button
    And the user enters "invalidEmail" into the email field
    And the user clicks on the "Next" button
    Then the user should see an error message "Please enter a valid email address"

  Scenario: Login with unregistered email
    Given the user is on the Login screen
    When the user enters an unregistered email into the email field
    And the user clicks on the "Next" button
    Then the user should see an error message "Email not found"

  Scenario: Login with empty email field
    Given the user is on the Login screen
    When the user clicks on the "Login" button
    And the user leaves the email field empty
    And the user clicks on the "Next" button
    Then the user should see an error message "Email is required"

  Scenario: Login with empty password field
    Given the user has entered a valid email and reached the password screen
    When the user leaves the password field empty
    And the user clicks on the "Login" button
    Then the user should see an error message "Password is required"

  Scenario: Login with incorrect password
    Given the user has entered a valid email and reached the password screen
    When the user enters an incorrect password into the password field
    And the user clicks on the "Login" button
    Then the user should see an error message "Incorrect password"

  Scenario: Login with multiple incorrect password attempts
    Given the user has entered a valid email and reached the password screen
    When the user enters incorrect password 3 times
    Then the user should see a message "Your account is temporarily locked"

  Scenario: Login with email and password containing only spaces
    Given the user is on the Login screen
    When the user enters spaces into the email or password fields
    And the user clicks on the "Login" button
    Then the user should see an error message "Invalid credentials"

  Scenario: Login with network issue
    Given the user is on the Login screen
    When the user enters valid credentials
    And the network connection is lost
    Then the user should see an error message "Network error, please try again"
