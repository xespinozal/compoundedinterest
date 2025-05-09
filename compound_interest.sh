#!/bin/bash
#
# Description:
#   This script calculates the future value of an investment or loan
#   with compound interest, given the principal amount, annual interest rate,
#   time period, and compounding frequency.
#
# Usage:
#   ./compound_interest.sh <principal> <rate> <time> <compounding_frequency>
#
#   Where:
#     <principal>: The initial principal balance (a positive number).
#     <rate>: The annual interest rate (as a decimal, e.g., 0.05 for 5%) (a positive number).
#     <time>: The number of years the money is invested or borrowed for (a positive number).
#     <compounding_frequency>: The number of times that interest is compounded per year (a positive integer).
#
# Options:
#   None
#
# Exit Status:
#   0:  Success
#   1:  Error in arguments
#   2:  Error during calculation
#
# Author: [Your Name or Organization]
# Date:   [Date of Creation or Last Modification]
#
# License:
#   [The license under which this script is distributed, e.g., MIT License, GPL v3]
#

# Function to calculate compound interest
calculate_compound_interest() {
  # Input parameters are passed as arguments to the function
  local principal=$1       # Initial principal balance
  local rate=$2          # Annual interest rate (decimal)
  local time=$3          # Time period in years
  local compounding_frequency=$4 # Compounding frequency per year

  # Input validation: Check for the correct number of arguments
  if [ $# -ne 4 ]; then
    echo "Error: Incorrect number of arguments. Expected 4." >&2
    echo "Usage: $0 <principal> <rate> <time> <compounding_frequency>" >&2
    return 1
  fi

  # Input validation: Check if the arguments are valid numbers and positive
  if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Principal must be a positive number." >&2
    return 1
  fi
  if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Interest rate must be a positive number." >&2
    return 1
  fi
  if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Time must be a positive number." >&2
    return 1
  fi
  if ! [[ "$compounding_frequency" =~ ^[0-9]+$ ]]; then
    echo "Error: Compounding frequency must be a positive integer." >&2
    return 1
  fi

  # Input validation: Check for positive values
  if (( $(echo "$principal > 0" | bc -l) != 1 )); then
    echo "Error: Principal must be greater than zero." >&2
    return 1
  fi
  if (( $(echo "$rate > 0" | bc -l) != 1 )); then
    echo "Error: Interest rate must be greater than zero." >&2
    return 1
  fi
  if (( $(echo "$time > 0" | bc -l) != 1 )); then
    echo "Error: Time must be greater than zero." >&2
    return 1
  fi
  if (( $compounding_frequency -le 0 )); then
    echo "Error: Compounding frequency must be greater than zero." >&2
    return 1
  fi

  # Perform the calculation using the compound interest formula:
  # A = P (1 + r/n)^(nt)
  #  Where:
  #  A = the future value of the investment/loan, including interest
  #  P = the principal investment amount (the initial deposit or loan amount)
  #  r = the annual interest rate (as a decimal)
  #  n = the number of times that interest is compounded per year
  #  t = the number of years the money is invested or borrowed for
  #
  # Use 'bc' for floating-point arithmetic
  amount=$(echo "scale=2; $principal * (1 + $rate / $compounding_frequency)^( $compounding_frequency * $time )" | bc -l)

  # Check for errors during calculation (though 'bc' rarely fails)
  if [ -z "$amount" ]; then
    echo "Error: Calculation failed." >&2
    return 2
  fi

  # Output the result
  echo "$amount"
  return 0
}

# Main part of the script
if __name__ == "__main__"; then
  # Call the function and store the result
  future_value=$(calculate_compound_interest "$1" "$2" "$3" "$4")

  # Check the return status of the function call.
  if [ $? -eq 0 ]; then
    # Print the result from the function
    echo "The future value is: $future_value"
  else
    # Error message is already printed by the function.
    exit 1
  fi
fi
