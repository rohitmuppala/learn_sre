#!/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Simple Calculator"
    echo "Usage: $0"
    echo "Prompts for two numbers and an operator (+, -, *, /), then outputs the result."
    echo "Example:"
    echo "  $0"
    echo "  Enter first number: 8"
    echo "  Enter second number: 2"
    echo "  Enter operator (+, -, *, /): /"
    echo "  The result of 8 / 2 is: 4"
    exit 0
fi

echo -n "Enter first number: "
read num1
echo -n "Enter second number: "
read num2
echo -n "Enter operator (+, -, *, /): "
read op

case "$op" in
    "+") result=$((num1 + num2));;
    "-") result=$((num1 - num2));;
    "*") result=$((num1 * num2));;
    "/") 
        if [ "$num2" -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$((num1 / num2))
        ;;
    *)
        echo "Error: Unsupported operator. Use one of +, -, *, /"
        exit 1
        ;;
esac

echo "The result of $num1 $op $num2 is: $result"
