#!/bin/bash

# Prompt the user for the principal amount
read -p "Enter the principal amount: " principal

# Validate if the input is a number
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Invalid principal amount. Please enter a number."
  exit 1
fi

# Prompt the user for the annual interest rate
read -p "Enter the annual interest rate (as a decimal, e.g., 0.05 for 5%): " rate

# Validate if the input is a number between 0 and 1
if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$rate < 0 || $rate > 1" | bc -l) )); then
  echo "Error: Invalid interest rate. Please enter a decimal between 0 and 1."
  exit 1
fi

# Prompt the user for the time period in years
read -p "Enter the time period in years: " time

# Validate if the input is a positive number
if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]] || (( $(echo "$time <= 0" | bc -l) )); then
  echo "Error: Invalid time period. Please enter a positive number."
  exit 1
fi

# Calculate the simple interest
interest=$(echo "scale=2; $principal * $rate * $time" | bc -l)

# Calculate the total amount
total_amount=$(echo "scale=2; $principal + $interest" | bc -l)

# Display the results
echo ""
echo "Simple Interest Calculation:"
echo "--------------------------"
echo "Principal Amount: \$$(printf "%.2f" "$principal")"
echo "Annual Interest Rate: $(echo "$rate * 100" | bc -l)% "
echo "Time Period: $time years"
echo "Simple Interest: \$$(printf "%.2f" "$interest")"
echo "Total Amount (Principal + Interest): \$$(printf "%.2f" "$total_amount")"

exit 0