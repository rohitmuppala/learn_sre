1. Simple Calculator 
Write a script that takes two numbers as input from the user and performs a simple calculation (e.g., addition) on them. 
Concepts to test: 
Arithmetic Operations: Using expr or (()) for calculations 
User Input: Getting multiple inputs 
Variables: Storing numbers and the result 
#!/usr/bin/bash

    # Show help if requested
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "Simple Calculator"
        echo "Usage: $0"
        echo "Prompts for two numbers and an operator (+, -, *, /), then outputs the result."
        echo "Example:"
        echo "  ./$0"
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
            result=$((num1 / num2));;
        *)
            echo "Error: Unsupported operator. Use one of +, -, *, /"
            exit 1;;
    esac

    echo "The result of $num1 $op $num2 is: $result"

2. File Checker 
Create a script that checks if a file exists. If it does, print a message stating that the file exists. If it doesn't, print a message saying it does not exist. 
Concepts to test: 
Conditional Statements: The if statement 
File Tests: The -f operator to check for a regular file 
Command Line Arguments: Using $1 to get the first argument passed to the script 
    #!/usr/bin/bash

    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "File Checker"
        echo "Usage: $0 <file1> [file2 ... fileN]"
        echo "Checks if each specified file exists and prints a message for each."
        echo "Example: $0 notes.txt report.pdf"
        exit 0
    fi

    if [ "$#" -eq 0 ]; then
        echo "Error: No filenames provided."
        echo "Use --help for usage."
        exit 1
    fi

    for file in "$@"; do
        if [ -f "$file" ]; then
            echo "File '$file' exists."
        else
            echo "File '$file' does not exist."
        fi
    done

3. Directory Lister 
Write a script that takes a directory path as an argument and lists all the files and directories inside it using a for loop. 
Concepts to test: 
Loops: The for loop 
Command Line Arguments: Using $1 
Command Substitution: Using $(ls $1) to get the output of the ls command and iterate over it 
    #!/usr/bin/bash

    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "Directory Lister"
        echo "Usage: $0 <dir1> [dir2 ... dirN]"
        echo "Lists all files and directories inside each specified directory."
        echo "Example: $0 /home/user /tmp"
        exit 0
    fi

    if [ "$#" -eq 0 ]; then
        echo "Error: No directory paths provided."
        echo "Use --help for usage."
        exit 1
    fi

    for dir in "$@"; do
        if [ -d "$dir" ]; then
            echo "Listing contents of directory: $dir"
            for item in $(ls "$dir"); do
                echo "  $item"
            done
        else
            echo "Error: '$dir' is not a directory."
        fi
    done

4. User Information 
Write a script that displays the current logged-in user and the current date and time. 
Concepts to test: 
System Variables: Using built-in variables like $USER 
Command Substitution: Using $(command) to capture the output of a command 
Built-in Commands: The whoami and date commands 

5. Function Practice 
Create a script with a function called check_ping that takes an IP address or hostname as an argument. The function should use the ping command to check if the host is reachable. If it is, print "Host is reachable." Otherwise, print "Host is unreachable." 
Concepts to test: 
Functions: Defining and calling a function. 
Function Arguments: Passing arguments to a function ($1). 
Conditional Logic: Check the exit status of a command. In bash, a zero exit status usually means success. 
Input Validation: Check if an argument was provided. 
Hints: 
The ping command returns a zero exit status if it successfully sends and receives a packet. 
You can use ping -c 1 to send just one packet. 
The special variable $? holds the exit status of the last executed command. 

6. Backup Utility 💾 
Write a script that backs up a specified directory by compressing it into a .tar.gz archive. The script should name the backup file with the current date and time. 
Concepts to test: 
Command Line Arguments: Accept the directory to back up as an argument ($1). 
Command Substitution: Use date to get the current date in a specific format (e.g., %Y-%m-%d). 
Archiving and Compression: Use the tar command with the appropriate options (-czf). 
String Manipulation: Concatenate strings to create the output filename. 
Hints: 
tar -czf is used to create a gzipped tar archive. 
The date command can format output with date +%Y-%m-%d. 

7. Log File Analyzer 📝 
Create a script that takes a log file as an argument and counts the number of times a specific keyword (e.g., "ERROR" or "WARNING") appears in it. The script should print the total count. 
Concepts to test: 
Command Line Arguments: Accept the log file name and the keyword as arguments ($1 and $2). 
Text Processing: Use grep with the -c option to count occurrences. 
Variables: Store the count in a variable. 
Hints: 
grep -c "ERROR" /path/to/logfile.log will count all lines containing "ERROR". 
Remember to handle cases where the file or keyword might not be provided. 

8. Disk Space Monitor 🖥️ 
Write a script that checks the current disk usage of the root (/) file system. If the usage exceeds a certain percentage (e.g., 80%), print a warning message. 
Concepts to test: 
Command Substitution: Use df to get disk usage information. 
Piping: Use | to pass the output of df to grep. 
Text Processing: Use awk to extract the percentage value. 
Conditional Logic: Use if to compare the usage against a threshold. 
Integer Comparison: Use the -gt (greater than) operator. 
Hints: 
The command df -h / will show disk usage in a human-readable format. 
The command df -h / | grep / isolates the line for the root partition. 
The command awk '{print $5}' will print the fifth column, which contains the percentage. 