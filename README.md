# iframe Checker Script

This Bash script checks if subdomains allow iframe loading by examining `X-Frame-Options` and `Content-Security-Policy` headers. The script runs in parallel with multiple threads for efficiency and logs results in color-coded output.

## Prerequisites

- **Bash**: The script is written for a Bash environment.
- **curl**: Make sure `curl` is installed for sending HTTP requests.

## Instructions

1. **Clone the Repository**
   
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/check_iframe.git
   cd check_iframe
   ```

2. Give execute permissions to the script:

```
chmod +x check_iframe.sh
```

3. Edit the Subdomains File

Update the SUBDOMAINS_FILE variable in the script if your subdomains file has a different path or filename. The default is:

```
SUBDOMAINS_FILE="live_subdomains"
```

4. Run the Script

```
./check_iframe.sh
```

Allowed iframe domains will be logged in allowed_iframe_domains.txt.
The console output will display results with color-coded messages:

Green: iframe loading is allowed.
Red: iframe loading is restricted.

## Configuration

THREADS: You can adjust the number of parallel threads by changing the THREADS variable in the script.

```
THREADS=10
```

Create a file called live_subdomains in the same directory, containing the subdomains you want to check:

```
example.com
example2.com
```
