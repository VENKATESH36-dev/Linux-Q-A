1) How do you find all `.log` files in the `/var/log` directory that were modified more than 
15 days ago, but exclude those files that are larger than 500MB? 

find /var/log -name "*.log" -type f -mtime +15 ! -size +500M

2) How can you search for all symbolic links in a directory and delete them using a single 
`find` command? 

find /path/to/directory -type l -delete

3) Using `find`, how do you locate files in the `/home/user` directory that are owned by a 
user other than the current owner? 

find /home/user ! -user $(whoami)

4) How can you find all files in the `/etc` directory that contain the word "config" in their 
name and have write permission for others? 

find /etc -type f -name "*config*" -perm -002

5)  How can you search for all lines in a file `/etc/passwd` that do not contain the word 
"bash"? 

grep -v "bash" /etc/passwd

6) How do you search recursively through all files in a directory for a specific string, showing 
only the matching filenames and excluding binary files? 

grep -rl --exclude-binary "specific_string" /path/to/directory

7) How can you search for the word "error" in a file, displaying the surrounding 3 lines 
before and after each match?

grep -C 3 "error" filename

8)  Using `grep`, how would you find all occurrences of the word "root" in `/etc/passwd` that 
start at the beginning of a line? 

grep "^root" /etc/passwd

9)  How can you create a compressed archive of the `/home/user` directory, excluding all 
`.mp4` files? 

tar --exclude='*.mp4' -czf user_archive.tar.gz -C /home user .

10)  How would you extract only a specific file `file.txt` from a `.tar.gz` archive without 
extracting the entire archive?

tar -xzf archive.tar.gz file.txt

11) How can you append a file called newfile.txt to an existing archive.tar.gz without 
decompressing the archive?

1 --> extract the existing .tar.gz archive:

tar -xzf archive.tar.gz

2 --> Append the new file to the uncompressed .tar archive:

tar -rf archive.tar newfile.txt

3 --> Compress the .tar archive back to .tar.gz

gzip archive.tar


12) How would you list the contents of a .tar.gz archive without extracting it? 

tar -zxvf archive.tar.gz

13) How can you list all currently running processes and then filter for processes that 
include the word "java", showing only the process ID and name? 

ps aux | grep "java" | awk '{print $2, $11}'

14) How can you display a list of all files in `/var/log`, then filter for files containing the word 
"error" using both `ls` and `grep` in a pipeline? 

ls /var/log | grep "error"

15) How do you count the number of lines in a file that contain the word "failed" using 
`grep` and `wc`? 

grep "failed" filename | wc -l

16) How can you display the last 20 lines of a log file and filter the lines that contain the 
word "critical" using a combination of `tail` and `grep`? 

tail -n 20 logfile.log | grep "critical"

17) How do you display the disk usage of all files and directories in `/home/user` in human-readable format, sorted by size in descending order

du -h /home/user | sort -hr

18) How can you display the total disk usage of the `/var` directory but exclude the 
subdirectory `/var/log`? 

du -sh --exclude=/var/log /var

19) How can you use `du` to find the disk usage of files larger than 100MB in a directory? 
 
find /path/to/directory -type f -size +100M -exec du -h {} +

20) How do you display the disk usage of the 10 largest directories in the `/usr` directory 
using `du`? 

du -h /usr/* | sort -hr | head -n 10














