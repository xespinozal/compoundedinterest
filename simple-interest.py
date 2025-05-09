def calculate_simple_interest():
    """
    Calculates simple interest based on user-provided principal,
    annual interest rate, and time period.

    This function prompts the user for the necessary inputs,
    performs input validation to ensure they are valid numeric values
    within acceptable ranges, calculates the simple interest and
    the total amount, and then displays the results in a user-friendly format.

    Returns:
        None. The function prints the calculated results to the console.
    """
    while True:
        try:
            principal = float(input("Enter the principal amount: "))
            if principal < 0:
                print("Error: Principal amount cannot be negative.")
                continue
            break
        except ValueError:
            print("Error: Invalid input. Please enter a numeric value for the principal.")

    while True:
        try:
            rate = float(input("Enter the annual interest rate (as a decimal, e.g., 0.05 for 5%): "))
            if not 0 <= rate <= 1:
                print("Error: Invalid interest rate. Please enter a decimal between 0 and 1.")
                continue
            break
        except ValueError:
            print("Error: Invalid input. Please enter a numeric value for the interest rate.")

    while True:
        try:
            time = float(input("Enter the time period in years: "))
            if time <= 0:
                print("Error: Time period must be a positive number.")
                continue
            break
        except ValueError:
            print("Error: Invalid input. Please enter a numeric value for the time period.")

    # Calculate simple interest using the formula: I = P * R * T
    interest = principal * rate * time

    # Calculate the total amount: A = P + I
    total_amount = principal + interest

    # Display the results with clear formatting
    print("\nSimple Interest Calculation:")
    print("--------------------------")
    print(f"Principal Amount: ${principal:.2f}")
    print(f"Annual Interest Rate: {rate * 100:.2f}%")
    print(f"Time Period: {time:.2f} years")
    print(f"Simple Interest: ${interest:.2f}")
    print(f"Total Amount (Principal + Interest): ${total_amount:.2f}")

if __name__ == "__main__":
    """
    This block ensures that the 'calculate_simple_interest()' function
    is executed only when the script is run directly.
    """
    calculate_simple_interest()