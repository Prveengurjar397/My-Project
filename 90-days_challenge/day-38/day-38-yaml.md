# Day 38 – YAML Basics

## Challenge Tasks & Solutions

### Task 1 & 2: `person.yaml` (Key-Value Pairs & Lists)

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
1. **Block Style:** Each item is written on a new line starting with a hyphen and a space (`- item`), as used in `tools`.
2. **Inline / Flow Style:** All items are written on a single line inside square brackets separated by commas (`[item1, item2]`), as used in `hobbies`.

---

### Task 3 & 4: `server.yaml` (Nested Objects & Multi-line Strings)

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
- **`|` (Literal Block Style):** Preserves every newline (`\n`) exactly as written. Used for **shell scripts, Linux commands, and multi-line code** where line breaks must remain intact.
- **`>` (Folded Block Style):** Folds multiple lines into a single line separated by spaces. Used for **long paragraphs, descriptions, or text blocks** written across multiple lines for readability.

---

### Task 5: Validate Your YAML
1. Installed `yamllint` on Ubuntu (`sudo apt install yamllint -y`).
2. Validated both `person.yaml` and `server.yaml` using `yamllint`.
3. **Intentionally breaking indentation:** Adding an extra space (3 spaces instead of 2) triggers:
   `wrong indentation: expected 2 but found 3 (indentation)` or `syntax error: mapping values are not allowed here (syntax)`.
4. Fixed the indentation back to 2 spaces and re-validated (`0 errors`).

---

### Task 6: Spot the Difference
**What is wrong with Block 2?**
- In Block 2, the list items under `tools:` have **inconsistent indentation**: `- docker` has **0 spaces**, whereas `- kubernetes` has **2 spaces**.
- In YAML, all items belonging to the same list must align at the exact same indentation level. Because `- kubernetes` is indented further than `- docker`, YAML fails with a syntax error (`expected <block end>, but found '-'`).

---

## Documentation: What I Learned (3 Key Points)
1. **Spaces Only, Never Tabs:** YAML strictly relies on spaces (2 spaces standard) for hierarchy; even a single tab (`\t`) breaks the parser.
2. **Debugging Errors Bottom-to-Top:** Tools like `yamllint` and PyYAML point directly to the exact line and column (`line:col`), making syntax issues easy to fix when read from the bottom up.
3. **Multi-line Operators (`|` vs `>`):** Using `|` keeps multi-line shell commands executable on separate lines, while `>` folds wrapped text into a single continuous line.
   
