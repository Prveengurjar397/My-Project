# Day 38 – YAML Basics & Production Debugging Guide (`#90DaysOfDevOps`)

> **Overview:** Complete hands-on YAML configurations (`person.yaml` & `server.yaml`), **lint-free CLI debugging techniques** (using Linux & Python), real terminal error logs, and a **5-day pre-interview revision cheatsheet**.

---

## Table of Contents
1. [Task 1 & 2: `person.yaml` (Key-Value Pairs & Lists)](#task-1--2-personyaml-key-value-pairs--lists)
2. [Task 3 & 4: `server.yaml` (Nested Objects & Multi-line Strings)](#task-3--4-serveryaml-nested-objects--multi-line-strings)
3. [Debugging YAML *Without* `yamllint` (Linux & Python CLI Methods)](#debugging-yaml-without-yamllint-linux--python-cli-methods)
4. [Real Errors Encountered & How I Fixed Them (Troubleshooting Log)](#real-errors-encountered--how-i-fixed-them-troubleshooting-log)
5. [Task 5: Validate Your YAML (`yamllint` & Indentation Break Test)](#task-5-validate-your-yaml-yamllint--indentation-break-test)
6. [Task 6: Spot the Difference](#task-6-spot-the-difference)
7. [Documentation: What I Learned (3 Key Points)](#documentation-what-i-learned-3-key-points)
8. [Interview Quick-Revision Cheatsheet (Read 5 Days Before Interview)](#interview-quick-revision-cheatsheet)

---
  
## Task 1 & 2: `person.yaml` (Key-Value Pairs & Lists)

**File: `person.yaml`**
```yaml
---
name: Praveen Gurjar
role: DevOps
experience_years: 0
learning: true
tools:
  - linux
  - github-actions
  - jira
  - kubernetes
  - terraform
hobbies: [building-large-projects, deploying-my-startup]
```

**Verify (`cat -A person.yaml`):**
- Checked with `cat -A person.yaml` — clean formatting, proper 2-space indentation, and no hidden tabs (`^I`).

**Notes: What are the two ways to write a list in YAML?**

| Style | Syntax Example | When to Use |
| :--- | :--- | :--- |
| **Block Style** | `- linux`<br>`- kubernetes` | Written on new lines with `- item`. Best for long lists, readable Git diffs, and CI/CD steps. |
| **Inline / Flow Style** | `[item1, item2]` | Written on a single line inside square brackets separated by commas. Best for compact arrays. |

---

## Task 3 & 4: `server.yaml` (Nested Objects & Multi-line Strings)

**File: `server.yaml` (Using `|` Literal Block Style)**
```yaml
---
server:
  name: ubuntu-latest
  ip: 197.195.0.0
  port: 3000

database:
  host: http://localhost:3001
  name: postgres
  credentials:
    user: praveen
    password: secreate@123

startup_script: |
  pwd
  cat /var/log/error.txt
  find . -name "*.log"
```

**Testing `>` Folded Block Style:**
```yaml
startup_script: >
  pwd
  cat /var/log/error.txt
  find . -name "*.log"
```

**Verify: What happens when adding a Tab (`\t`) instead of spaces?**
- YAML strictly forbids tab characters for indentation. Validating a file with a tab immediately throws a syntax error:
  `ScannerError: while scanning for the next token, found character '\t' that cannot start any token`.

**Notes: When would you use `|` vs `>`?**
- **`|` (Literal Block Style):** Preserves every newline (`\n`) exactly as written (`'pwd\ncat /var/log/error.txt\nfind . -name "*.log"\n'`). Used for **shell scripts, Linux commands, and multi-line code** where line breaks must remain intact.
- **`>` (Folded Block Style):** Folds multiple lines into a single line separated by spaces (`'pwd cat /var/log/error.txt find . -name "*.log"\n'`). Used for **long paragraphs, descriptions, or text blocks** written across multiple lines for readability.

---

## Debugging YAML *Without* `yamllint` (Linux & Python CLI Methods)

In minimal production containers or fresh servers where `yamllint` is not pre-installed, I used built-in **Linux utilities** and **Python's `PyYAML` parser** to debug files:

### 1. Detect Hidden Tabs (`^I`) & Trailing Spaces (`cat -A`)
```bash
cat -A server.yaml
```
* **`^I`** reveals illegal Tab characters (`\t`), and **`$`** marks the exact end of each line to catch accidental trailing spaces.

### 2. Inspect Exact Line Numbers (`nl -ba`)
```bash
nl -ba server.yaml
```
* Prints line numbers next to every line, making it fast to locate the exact `line:column` reported by parsers.

### 3. Validate Syntax via Python One-Liner (Zero Extra Tools Needed)
```bash
python3 -c 'import yaml, sys; yaml.safe_load(sys.stdin); print("VALID YAML!")' < server.yaml
```
* Parses YAML into a Python dictionary; prints `VALID YAML!` if valid, or outputs the exact `ScannerError` / `ParserError` with line and column numbers.

### 4. Verify How YAML Evaluates Multi-line Strings in Memory
```bash
python3 -c 'import yaml; data = yaml.safe_load(open("server.yaml")); print(repr(data["startup_script"]))'
```
* Confirms whether `|` preserved `\n` newlines or `>` folded them into spaces.

---

## Real Errors Encountered & How I Fixed Them (Troubleshooting Log)

During hands-on practice, I intentionally triggered and resolved real YAML parser errors—the exact issues seen in GitHub Actions, Kubernetes, and Ansible pipelines:

### Error 1: Tab Character in Indentation (`ScannerError`)
* **Command Run:** `printf "\tport: 3000\n" >> server.yaml`
* **Actual Error Output:**
  ```text
  yaml.scanner.ScannerError: while scanning for the next token
  found character '\t' that cannot start any token
    in "<stdin>", line 13, column 1
  ```
* **Root Cause & Fix:** YAML strictly forbids `\t` (Tab). Located `^I` via `cat -A`, replaced it with 2 spaces, and re-validated.

### Error 2: Mixing Scalar Value & Nested Keys on the Same Parent
* **Broken Code:**
  ```yaml
  database: postgres
    host: localhost
  ```
* **Actual Error Output:** `syntax error: mapping values are not allowed here (syntax)`
* **Root Cause & Fix:** A key cannot hold both a direct string (`postgres`) and nested child keys (`host:`) simultaneously. Removed `postgres` from the parent key line.

### Error 3: Missing Space After Colon (`:`) & Uneven List Indentation
* **Broken Code:** `port:5432` (missing space) and `- 443` indented with 3 spaces instead of 2.
* **Fix:** Standardized all nested levels to **2 spaces** and added a mandatory space after `:` (`port: 5432`).

---

## Task 5: Validate Your YAML (`yamllint` & Indentation Break Test)
1. Installed `yamllint` on Ubuntu (`sudo apt install yamllint -y`).
2. Validated both `person.yaml` and `server.yaml` using `yamllint`.
3. **Intentionally breaking indentation:** Adding an extra space (3 spaces instead of 2) triggers:
   `wrong indentation: expected 2 but found 3 (indentation)` or `syntax error: mapping values are not allowed here (syntax)`.
4. Fixed the indentation back to 2 spaces, added `---` at line 1, and re-validated (`0 errors, 0 warnings`).

---

## Task 6: Spot the Difference
```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```
**What is wrong with Block 2?**
- In Block 2, the list items under `tools:` have **inconsistent indentation**: `- docker` has **0 spaces**, whereas `- kubernetes` has **2 spaces**.
- In YAML, all items belonging to the same list must align at the exact same indentation level. Because `- kubernetes` is indented further than `- docker`, YAML fails with a syntax error (`expected <block end>, but found '-'`).

---

## Documentation: What I Learned (3 Key Points)
1. **Spaces Only, Never Tabs:** YAML strictly relies on spaces (2 spaces standard) for hierarchy; even a single tab (`\t`) breaks the parser.
2. **Debugging Errors Bottom-to-Top:** Tools like `yamllint` and PyYAML point directly to the exact line and column (`line:col`), making syntax issues easy to fix when read from the bottom up.
3. **Multi-line Operators (`|` vs `>`):** Using `|` keeps multi-line shell commands executable on separate lines, while `>` folds wrapped text into a single continuous line.

---

## Interview Quick-Revision Cheatsheet (Read 5 Days Before Interview)
* **Read Stack Traces Bottom-to-Top:** The last 2–3 lines always show the exact `line:column` and root cause.
* **Booleans vs Strings:** `true` / `false` / `yes` / `no` are parsed as booleans; wrap them in quotes (`"true"`) if a tool requires a literal string.
* **Special Characters:** Always quote strings containing colons (`: `) or hashes (`#`) so YAML does not treat them as key-value separators or comments.
* **Document Markers:** `---` marks the start of a YAML document (used to separate multiple Kubernetes manifests in one file), and `...` marks the end.
  
