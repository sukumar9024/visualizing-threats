import re
import json
import sys
import os
import datetime
from collections import defaultdict
import matplotlib.pyplot as plt

# Define attack patterns
ATTACK_PATTERNS = {
    "Brute Force": r"Failed password for invalid user",
    "DDoS": r"connection attempts from",
    "RCE": r"system\(|exec\(|shell_exec\(",
    "XSS": r"<script>.*?</script>",
    "Path Traversal": r"\.\./|/etc/passwd",
    "SQL Injection": r"(SELECT|INSERT|UPDATE|DELETE).*?(FROM|INTO|WHERE)"
}

# Function to parse the log file and detect threats
def parse_log_file(log_file):
    threats = []
    with open(log_file, "r") as file:
        for line in file:
            for attack_type, pattern in ATTACK_PATTERNS.items():
                if re.search(pattern, line, re.IGNORECASE):
                    threats.append({
                        "attack_type": attack_type,
                        "log_entry": line.strip(),
                        "detected_at": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                    })
                    break  # Stop checking other attack types once one is found
    return threats

# Function to generate and save the JSON report
def generate_json_report(user_id, file_id, threats):
    report_folder = "reports"
    os.makedirs(report_folder, exist_ok=True)  # Ensure the folder exists

    report_filename = f"report_{user_id}_{file_id}.json"
    report_path = os.path.join(report_folder, report_filename)

    with open(report_path, "w") as file:
        json.dump(threats, file, indent=4)

    return report_path

# Function to create visualizations based on detected threats
def create_visualizations(threats, user_id, file_id):
    attack_counts = defaultdict(int)
    for threat in threats:
        attack_counts[threat["attack_type"]] += 1

    # Create a bar chart for attack types
    plt.figure(figsize=(10, 6))
    plt.bar(attack_counts.keys(), attack_counts.values(), color='red')
    plt.xlabel("Attack Type")
    plt.ylabel("Frequency")
    plt.title("Threats Detected")
    plt.xticks(rotation=45)
    visualization_filename = f"visualization_{user_id}_{file_id}.png"
    visualization_path = os.path.join("visualizations", visualization_filename)
    plt.savefig(visualization_path)
    plt.close()  # Close the figure to avoid memory leaks

    return visualization_filename

# Main script execution
if __name__ == "__main__":
    if len(sys.argv) < 4:
        print(json.dumps({"error": "Missing arguments"}))
        sys.exit(1)

    log_file = sys.argv[1]   # Path to the log file
    user_id = sys.argv[2]    # User ID (passed as argument)
    file_id = sys.argv[3]    # File ID (passed as argument)

    # Parse log file and detect threats
    threats = parse_log_file(log_file)

    # Generate and store JSON report
    report_path = generate_json_report(user_id, file_id, threats)

    # Create visualizations
    visualization_filename = create_visualizations(threats, user_id, file_id)

    # Output the summary as JSON
    print(json.dumps({
        "file_id": file_id,
        "threat_count": len(threats),
        "report_filename": os.path.basename(report_path),
        "visualization": visualization_filename,
        "threats": threats
    }))
