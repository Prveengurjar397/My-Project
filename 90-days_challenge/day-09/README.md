# Day 09 – Linux User & Group Management Challenge

## 🎯 Objective
Today's goal is to practice Linux user and group management by completing hands-on challenges.

**Key Focus Areas:**
- Create users and set secure passwords
- Create groups and assign user memberships
- Set up shared directories with proper group ownership and permissions (`775`)
- Apply troubleshooting fundamentals from Days 1–7 to diagnose access issues

---

## 📦 Expected Deliverables
- 📄 A detailed markdown documentation file: [`day-09-user-management.md`](./day-09-user-management.md)
- 📸 Screenshots of terminal command outputs
- 💻 Complete list of Linux commands practiced

---

## 🛠️ Challenge Tasks

### Task 1: Create Users *(20 mins)*
- Create three users with home directories (`-m`) and passwords:
  - `tokyo`
  - `berlin`
  - `professor`
- **Verify:** Inspect `/etc/passwd` and `/home/` directory.

---

### Task 2: Create Groups *(10 mins)*
- Create two primary team groups:
  - `developers`
  - `admins`
- **Verify:** Inspect `/etc/group`.

---

### Task 3: Assign Users to Groups *(15 mins)*

| User | Assigned Group(s) |
| :--- | :--- |
| **`tokyo`** | `developers` |
| **`berlin`** | `developers`, `admins` *(both groups)* |
| **`professor`** | `admins` |

- **Verify:** Check group membership using `id` or `groups`.

---

### Task 4: Shared Project Directory *(20 mins)*
- Create directory: `/opt/dev-project`
- Set group owner to `developers`
- Set permissions to `775` (`rwxrwxr-x`)
- **Test & Verify:** Create test files as `tokyo` and `berlin`, and verify directory permissions.

---

### Task 5: Team Workspace *(20 mins)*
- Create user `nairobi` with a home directory
- Create group `project-team`
- Add `nairobi` and `tokyo` to `project-team`
- Create directory: `/opt/team-workspace`
- Set group owner to `project-team` and permissions to `775` (`rwxrwxr-x`)
- **Test & Verify:** Create a test file as `nairobi` and confirm access.

---

## 🔗 Solution & Documentation
👉 Check out the complete step-by-step commands, outputs, and troubleshooting notes in **[day-09-user-management.md](./updated-user-management.md)**.

