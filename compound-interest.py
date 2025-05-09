def calculate_compound_interest(principal, rate, time, compounding_frequency):
    """
    Calculates the future value of an investment or loan with compound interest.

    Args:
        principal (float): The initial principal balance.
        rate (float): The annual interest rate (as a decimal).
        time (float): The number of years the money is invested or borrowed for.
        compounding_frequency (int): The number of times that interest is compounded per year.

    Returns:
        float: The future value of the investment/loan, including interest.

    Raises:
        TypeError: if any of the input arguments are not of the expected type (float or int).
        ValueError: if rate or compounding_frequency are non-positive.

    Examples:
        >>> calculate_compound_interest(1000, 0.05, 3, 1) # Annually
        1157.625
        >>> calculate_compound_interest(1000, 0.05, 3, 12) # Monthly
        1161.472274864486
    """
    # Input validation with type and value checks
    if not isinstance(principal, (int, float)):
        raise TypeError("Principal must be a numeric value.")
    if not isinstance(rate, (int, float)):
        raise TypeError("Interest rate must be a numeric value.")
    if not isinstance(time, (int, float)):
        raise TypeError("Time must be a numeric value.")
    if not isinstance(compounding_frequency, int):
        raise TypeError("Compounding frequency must be an integer.")

    if rate <= 0:
        raise ValueError("Interest rate must be a positive value.")
    if compounding_frequency <= 0:
        raise ValueError("Compounding frequency must be a positive integer.")

    # Formula for compound interest:
    # A = P (1 + r/n)^(nt)
    # Where:
    # A = the future value of the investment/loan, including interest
    # P = the principal investment amount (the initial deposit or loan amount)
    # r = the annual interest rate (as a decimal)
    # n = the number of times that interest is compounded per year
    # t = the number of years the money is invested or borrowed for

    amount = principal * (1 + rate / compounding_frequency)**(compounding_frequency * time)
    return amount

if __name__ == "__main__":
    # Example usage of the function
    principal_amount = 1000  # Initial investment
    annual_interest_rate = 0.05  # 5% annual interest rate
    investment_time = 5  # Investment period of 5 years
    compounded_annually = 1
    compounded_monthly = 12

    # Calculate and print the future value with annual compounding
    future_value_annually = calculate_compound_interest(principal_amount, annual_interest_rate, investment_time, compounded_annually)
    print(f"Future value compounded annually: ${future_value_annually:.2f}")

    # Calculate and print the future value with monthly compounding
    future_value_monthly = calculate_compound_interest(principal_amount, annual_interest_rate, investment_time, compounded_monthly)
    print(f"Future value compounded monthly: ${future_value_monthly:.2f}")

    try:
        # Example of invalid input
        calculate_compound_interest(1000, -0.02, 2, 4)
    except ValueError as e:
        print(f"Error: {e}")

    try:
        # Example of invalid input type
        calculate_compound_interest("1000", 0.05, 3, 1)
    except TypeError as e:
        print(f"Error: {e}")
