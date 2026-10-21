#!/usr/bin/env bash
# Simple interest calculator: SI = (P × R × T) / 100
# Reads principal, annual rate of interest and time period from the user.

set -euo pipefail

# Accepts plain positive or zero decimals such as 1000, 7.5 or .5
is_number() {
  [[ $1 =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]
}

read_value() {
  local prompt=$1 value
  while true; do
    read -r -p "$prompt" value
    if is_number "$value"; then
      echo "$value"
      return
    fi
    echo "Please enter a valid non-negative number." >&2
  done
}

echo "Simple Interest Calculator"
echo "--------------------------"

principal=$(read_value "Enter the principal amount: ")
rate=$(read_value "Enter the annual rate of interest (%): ")
time_period=$(read_value "Enter the time period (years): ")

# Bash has no floating-point arithmetic, so awk does the calculation.
awk -v p="$principal" -v r="$rate" -v t="$time_period" 'BEGIN {
  si = p * r * t / 100
  printf "\nPrincipal:        %.2f\n", p
  printf "Rate of interest: %.2f%%\n", r
  printf "Time period:      %.2f years\n", t
  printf "Simple interest:  %.2f\n", si
  printf "Total amount:     %.2f\n", p + si
}'
