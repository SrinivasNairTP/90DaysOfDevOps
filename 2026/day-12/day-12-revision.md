Mindset & plan: My mindset and plan are still the same continuous learning and delivery, the core skills to learn and upskill

Processes & services:
checked for processes running on the instance using ps and ps aux no abnormalities found
checked for ssh service using systemctl status ssh found the service in starting state 
also checked for the logs using journalctl -u ssh and found few root login through ssh error 


File skills:
used copy command to copy file from source to destination
mkdir to create directory
chmod to change permissions and chown to change ownership of files and folders

cheat sheet refresh:
I would user ls command to list the files and folders and permissions and ownership
cat command to view the contents of a file
mv & cp commands to move and copy files
rm commad to delete a file with appropriate options
head and tail command to traverse through the logs from top and bottom

User/group sanity:
useradd and groupadd commands to add user and groups
create home directory for user using options -m 
Add user to multiple groups using usermod command with options -aG
verify user created using cat /etc/group

## Mini Self-Check 
1) Which 3 commands save you the most time right now, and why?  
ls -l, ps, grep, touch, mkdir
2) How do you check if a service is healthy? List the exact 2–3 commands you’d run first.  
to check if a service is healthy I would check first the status of the service using systemctl status <service-name> 
if it is not responding properly would restart using systemctl restart <service-name>
3) How do you safely change ownership and permissions without breaking access? Give one example command.  
using chown ownership can be changed for a user/group
using chmod permissions can be changed
4) What will you focus on improving in the next 3 days?
My focus is to get to know the commands which I haven't explored in these 12 tasks that's given and move on to the next assignment
