Day 06 – Linux Fundamentals: Read and Write Text Files

Objective

Practice basic Linux file creation, writing, appending, reading, copying, and moving files.

1. Create a File

Command

touch notes.md

Observation

The touch command created an empty file named notes.md.

2. Write Text to a File

Command

echo "Linux day 06 practice" > notes.txt

Observation

The > redirection created notes.txt and wrote the first line into it.

3. Append Text to a File

Command

echo " Learning file read and write commands " >> notes.txt

Observation

The >> redirection appended a new line to the existing file without removing the previous content.

I repeated the append command once more to practice appending data.

4. Read the Full File

Command

cat notes.txt

Output

Linux day 06 practice
 Learning file read and write commands 
 Learning file read and write commands

Observation

The cat command displayed the complete contents of the file.

5. Read the First Line

Command

head -n 1 notes.txt

Output

Linux day 06 practice

Observation

The head command displayed the first line of the file.

6. Read the Last Line

Command

tail -n 1 notes.txt

Output

 Learning file read and write commands

Observation

The tail command displayed the last line of the file.

7. Copy the File

Command

cp notes.txt backup.txt

Observation

The cp command created a copy of notes.txt named backup.txt.

The ls command confirmed the files:

backup.txt  filesystem  notes.md  notes.txt

8. Move/Rename the File

Command

mv backup.txt final_notes.txt

Observation

The mv command moved/renamed backup.txt to final_notes.txt.

Commands Practiced

touch – create a file

echo – write text

> – overwrite/write to a file

>> – append text to a file

cat – read the complete file

head – read the beginning of a file

tail – read the end of a file

cp – copy a file

mv – move or rename a file

ls – list files

Conclusion

Day 06 helped me practice basic Linux file handling and understand how files can be created, written, appended, read, copied, and renamed.
