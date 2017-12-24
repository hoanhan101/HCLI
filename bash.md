# `bash`

### navigation
- Change directory: `cd`
- Create a directory: `mkdir directory_name`
- Remove a directory: `mrdir directory_name
- Create a file: `touch file_name`
- Remove a file: `rm fike_name`
- List file: `ls`. Param `-l` for more details, `-a` for all files, including hidden filesk
- Copy a file: `cp file1 file2`
- Move a file: `mv file1 directory_name/file_name`
- Can use `mv` to rename file like `mv file1 file2`

### files
- Search for word in file `grep hello file_name`
- Show difference between 2 files: `diff file1 file2`
- Overwriting result to a file `ls > test`
- Appending to a file `ls >> test`

### file permission
- user: `u`, group: `g`, other people (everyone): `o`
- read: `r`, write: `w`, execute: `x`
- Add permission: `chmod o+w file_name`. 
- Delete permission: `chmod o-w file_name`
- Shortcut: `chmod 755 file_name`. 
- - 7, 5, 5 represents the individual permission for user, group, everyone.
- - 4: read
- - 2: write
- - 1: execute
- - 0: no permissions

### `ssh`
- ssh with public key: `ssh -i file_name.pem ubuntu@ip_address`
- Copy over network: `scp -r /Users/hoanhan/Downloads/from_folder hoanhan@ip_address:/home/hoanhan/to_folder`
