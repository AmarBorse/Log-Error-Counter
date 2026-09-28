# Log-Error-Counter
**Tech:** Bash, grep, Linux

## What it does
- A Bash script reads a log file and **counts the lines containing `ERROR`**.
- It shows the **last 5 errors**, so problems can be found quickly.
- It has a **check for a missing file** and prints a clear message instead of failing silently.

## Files
| File | Purpose |
|------|---------|
| `error_counter.sh` | The script |
| `sample.log` | A sample log to try it on |

## How the script works (step by step)
1. **Take input:** `LOG_FILE="${1:-application.log}"` uses the first argument as the file name (or `application.log` if none is given).
2. **Check file exists:** `if [ ! -f "$LOG_FILE" ]` -> prints `Error: log file '...' not found.` and exits with code 1.
3. **Count errors:** `grep -c "ERROR" file` returns the number of matching lines.
4. **Show last 5:** `grep "ERROR" file | tail -n 5` filters error lines, then keeps only the final five (the most recent, since logs grow downward).

## Run it
```bash
chmod +x error_counter.sh
./error_counter.sh sample.log
./error_counter.sh missing.log     # shows the "not found" message
```

## Sample output
```
Total ERROR lines in sample.log: 6
Last 5 errors:
--------------
2026-09-28 09:07:03 ERROR Timeout while reading from socket
2026-09-28 09:20:45 ERROR Failed to write cache file
2026-09-28 09:42:18 ERROR Invalid user token
2026-09-28 09:50:56 ERROR Out of memory in worker 3
2026-09-28 10:02:31 ERROR Payment gateway unreachable
```

## Commands used
| Command | Role |
|---------|------|
| `grep -c` | count matching lines |
| `grep` | filter lines with ERROR |
| `tail -n 5` | keep the last 5 lines |
| `[ -f file ]` | test if a file exists |
