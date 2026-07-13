#!/usr/bin/env python3
# Log File Analyzer
# Written by Ositadilima Nwabuisi
# Purpose: Read a log file and summarize errors/warnings

# Variables
log_file = "./sample.log"
error_count = 0
warning_count = 0
info_count = 0
error_lines = []
warning_lines = []

print("==============================")
print("  LOG FILE ANALYZER")
print("==============================")

# Read and analyze the log file
with open(log_file, "r") as file:
    for line in file:
        line = line.strip()  #To remove extra spaces/newlines

        if "ERROR" in line:
            error_count += 1
            error_lines.append(line)

        elif "WARNING" in line:
            warning_count += 1
            warning_lines.append(line)

        elif "INFO" in line:
            info_count += 1

# Print Summary
print(f"Log File: {log_file}")
print(f"Total INFO messages:    {info_count}")
print(f"Total WARNING messages: {warning_count}")
print(f"Total ERROR messages:   {error_count}")
print("==============================")

# Print Errors
if error_count > 0:
    print(f"\n ERRORS FOUND ({error_count}):")
    for error in error_lines:
        print(f"  → {error}")

# Print Warnings
if warning_count > 0:
    print(f"\n  WARNINGS FOUND ({warning_count}):")
    for warning in warning_lines:
        print(f"  → {warning}")

print("\n==============================")
print("  ANALYSIS COMPLETE")
print("==============================")
