import subprocess
import os

# Step 1: Ask for a branch name and create a new branch in git
branch_name = input("Enter the name of the new branch: ")
subprocess.run(["git", "checkout", "-b", branch_name])

# Step 2: List all changes and prompt user for files to add for commit
subprocess.run(["git", "status"])
files = os.listdir()
file_count = 1
print("Enter the numbers of the files you want to add for commit (separated by spaces): ")
for file in files:
    print(f"{file_count}. {file}")
    file_count += 1
file_numbers = input().split()
files_to_add = [files[int(num)-1] for num in file_numbers]
subprocess.run(["git", "add"] + files_to_add)

#Step 3: Now commit these files
print("Enter the commit message: ")
commit_message = input()
subprocess.run(["git", "commit", "-m", commit_message])

# Step 4: Push the new branch to the remote repository
subprocess.run(["git", "push", "-u", "origin", branch_name])

