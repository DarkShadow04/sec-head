#!/bin/bash

# Define text color for banner
color=("\033[1;31m" "\033[1;32m" "\033[1;33m" "\033[1;34m" "\033[1;35m" "\033[1;36m" "\033[1;37m")
random_color=${color[$RANDOM % ${#color[@]}]}
reset='\033[0m'

# Print banner
echo -e "$random_color"
echo -e "_
  █████████                               █████   █████                        █████
 ███░░░░░███                             ░░███   ░░███                        ░░███ 
░███    ░░░   ██████   ██████             ░███    ░███   ██████   ██████    ███████ 
░░█████████  ███░░███ ███░░███ ██████████ ░███████████  ███░░███ ░░░░░███  ███░░███ 
 ░░░░░░░░███░███████ ░███ ░░░ ░░░░░░░░░░  ░███░░░░░███ ░███████   ███████ ░███ ░███ 
 ███    ░███░███░░░  ░███  ███            ░███    ░███ ░███░░░   ███░░███ ░███ ░███ 
░░█████████ ░░██████ ░░██████             █████   █████░░██████ ░░████████░░████████
 ░░░░░░░░░   ░░░░░░   ░░░░░░             ░░░░░   ░░░░░  ░░░░░░   ░░░░░░░░  ░░░░░░░░ 
                                                                                    
_"

echo -e "${random_color} sec-head script by: Dark_Shadow04 ${reset}\n"
echo -e "${random_color} https://github.com/DarkShadow04  ${reset}\n"
echo -e "${random_color} Copyright 2023 Dark_Shadow04 ${reset}\n"



# Check for and install necessary dependencies
if ! command -v curl &> /dev/null; then
    echo "curl not found, installing..."
    sudo apt-get install -y curl
fi
if ! command -v grep &> /dev/null; then
    echo "grep not found, installing..."
    sudo apt-get install -y grep
fi
if ! command -v wkhtmltopdf &> /dev/null; then
    echo "wkhtmltopdf not found, installing..."
    sudo apt-get install -y wkhtmltopdf
fi

# Ask for target URL
read -p "Enter target URL: " url

# Check security headers
headers=$(curl -sI $url)

missing_headers=()

if ! echo "$headers" | grep -q "Strict-Transport-Security"; then
    missing_headers+=("Strict-Transport-Security")
fi

if ! echo "$headers" | grep -q "X-Content-Type-Options"; then
missing_headers+=("X-Content-Type-Options")
fi

if ! echo "$headers" | grep -q "X-Frame-Options"; then
missing_headers+=("X-Frame-Options")
fi

if ! echo "$headers" | grep -q "X-XSS-Protection"; then
missing_headers+=("X-XSS-Protection")
fi

if ! echo "$headers" | grep -q "Referrer-Policy"; then
missing_headers+=("Referrer-Policy")
fi

if ! echo "$headers" | grep -q "Permissions-Policy"; then
missing_headers+=("Permissions-Policy")
fi

#Output missing headers to console
if [ ${#missing_headers[@]} -eq 0 ]; then
echo "All security headers are present"
else
echo "The following security headers are missing: ${missing_headers[*]}"

# Create HTML file with missing headers
html_file="missing_headers.html"
echo "<h1>Missing Security Headers</h1>" > $html_file
echo "<p>The following security headers are missing on <a href=\"$url\">$url</a>:</p>" >> $html_file
echo "<ul>" >> $html_file
for header in "${missing_headers[@]}"; do
    echo "<li>$header</li>" >> $html_file
done
echo "</ul>" >> $html_file

# Add solutions to HTML file
echo "<p>Here are the solutions for each missing header:</p>" >> $html_file
echo "<ul>" >> $html_file
if [[ " ${missing_headers[*]} " == *"Strict-Transport-Security"* ]]; then
    echo "<li><strong>Strict-Transport-Security:</strong> Add the following code to your server configuration file (.htaccess, nginx.conf, etc.):</li>" >> $html_file
    echo "<pre>Header always set Strict-Transport-Security \"max-age=31536000; includeSubDomains; preload\"</pre>" >> $html_file
fi
if [[ " ${missing_headers[*]} " == *"X-Content-Type-Options"* ]]; then
    echo "<li><strong>X-Content-Type-Options:</strong> Add the following code to your server configuration file:</li>" >> $html_file
    echo "<pre>Header always set X-Content-Type-Options nosniff</pre>" >> $html_file
fi
if [[ " ${missing_headers[*]} " == *"X-Frame-Options"* ]]; then
    echo "<li><strong>X-Frame-Options:</strong> Add the following code to your server configuration file:</li>" >> $html_file
    echo "<pre>Header always set X-Frame-Options DENY</pre>" >> $html_file
fi
if [[ " ${missing_headers[*]} " == *"X-XSS-Protection"* ]]; then
    echo "<li><strong>X-XSS-Protection:</strong> Add the following code to your server configuration file:</li>" >> $html_file
    echo "<pre>Header always set X-XSS-Protection \"1; mode=block\"</pre>" >> $html_file
fi
if [[ " ${missing_headers[*]} " == *"Referrer-Policy"* ]]; then
    echo "<li><strong>Referrer-Policy:</strong> Add the following code to your server configuration file:</li>" >> $html_file
    echo "<pre>Header always set Referrer-Policy same-origin</pre>" >> $html_file
fi
if [[ " ${missing_headers[*]} " == "Permissions-Policy" ]]; then
echo "<li><strong>Permissions-Policy:</strong> Add the following code to your server configuration file:</li>" >> $html_file
echo "<pre>Header always set Permissions-Policy \"geolocation=(), microphone=(), camera=(), fullscreen=(self), payment=()\"</pre>" >> $html_file
fi
echo "</ul>" >> $html_file

# Create TXT file with missing headers
txt_file="missing_headers.txt"
echo "Missing Security Headers" > $txt_file
echo "" >> $txt_file
echo "The following security headers are missing on $url:" >> $txt_file
echo "" >> $txt_file
for header in "${missing_headers[@]}"; do
    echo "- $header" >> $txt_file
done

# Create PDF file with missing headers
pdf_file="missing_headers.pdf"
wkhtmltopdf $html_file $pdf_file

echo "Output files created: $html_file, $txt_file, $pdf_file"

fi

# Complete

echo "Script executed successfully with blessing of Dark_Shadow04."
