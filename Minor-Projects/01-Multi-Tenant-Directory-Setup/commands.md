# Commands Used

## 1. Create Company Directory

```bash
mkdir -p company
```

**Explanation:** Creates the main company directory.

---

## 2. Enter Company Directory

```bash
cd company
```

**Explanation:** Moves into the company directory.

---

## 3. Create Team Directories

```bash
mkdir -p {developer,devops}
```

**Explanation:** Creates separate directories for the Developer and DevOps teams.

---

## 4. Create Groups

```bash
sudo groupadd developer
sudo groupadd devops
```

**Explanation:** Creates Linux groups for different teams.

---

## 5. Create Users

```bash
sudo useradd -m rahul
sudo useradd -m aman
sudo useradd -m praveen
```

**Explanation:** Creates user accounts with home directories.

---

## 6. Add Users to Groups

```bash
sudo usermod -aG developer rahul
sudo usermod -aG developer aman
sudo usermod -aG devops praveen
```

**Explanation:** Adds users to their respective groups.

---

## 7. Change Ownership

```bash
sudo chown root:developer developer
sudo chown root:devops devops
```

**Explanation:** Assigns the correct group ownership to each directory.

---

## 8. Set Permissions

```bash
sudo chmod 2775 developer
sudo chmod 2775 devops
```

**Explanation:** Sets directory permissions and enables the SGID bit so new files inherit the directory's group.

---

## 9. Verify Configuration

```bash
ls -ld developer devops
id rahul
id aman
id praveen
```

**Explanation:** Verifies directory permissions and group membership.
