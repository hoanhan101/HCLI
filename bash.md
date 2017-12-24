# `bash`

### `navigation`
- Change directory: `cd`
- Create a directory: `mkdir directory_name`
- Remove a directory: `mrdir directory_name
- Create a file: `touch file_name`
- Remove a file: `rm fike_name`
- List file: `ls`. Param `-l` for more details, `-a` for all files, including hidden filesk
- Copy a file: `cp file1 file2`
- Move a file: `mv file1 directory_name/file_name`
- Can use `mv` to rename file like `mv file1 file2`

### `files`
- Search for word in file `grep hello file_name`
- Show difference between 2 files: `diff file1 file2`
- Overwriting result to a file `ls > test`
- Appending to a file `ls >> test`

### `file permission`
- user: `u`, group: `g`, other people (everyone): `o`
- read: `r`, write: `w`, execute: `x`
- Add permission: `chmod o+w file_name`. 
- Delete permission: `chmod o-w file_name`
- Shortcut: `chmod 755 file_name`. 
  - 7, 5, 5 represents the individual permission for user, group, everyone.
  - 4: read
  - 2: write
  - 1: execute
  - 0: no permissions

### `compress` & `extract`
- Compress to gz: `gzip file_name`
- Decompress gz: `gunzip file_name.gz`
- Compress mutiples files to tar: `tar cvf target_file.tar file1 file2`
- Decompress tar: `tar xvf target_file.tar`

### `ssh`
- Create a public/private key pair: `ssh-keygen -t rsa`
- Add key to that server: `ssh-copy-id root@ip_address` so next time just `ssh root@ip_address` then you're in. More at [The new boston](https://youtu.be/xWLgdSgsBFo)
- ssh with public key: `ssh -i file_name.pem ubuntu@ip_address`
- Copy over network: `scp -r /Users/hoanhan/Downloads/from_folder hoanhan@ip_address:/home/hoanhan/to_folder`

### `apt-get`
- Update: `sudo apt-get update`
- Install: `sudo apt-get install package_name`
- Install desktop program, for example `pycharm`:
  - First `cd` to the directory
  - Run `bash pycharm.sh`

### `user` & `group`
- Create a new user: `sudo useradd user_name`
- Create a password: `sudo passwd user_name`
- Create a group: `sudo groupadd group_name` 
- Add user to a group: `sudo usermod -a -G group_name user_name`
- Delete user from a group: `sudo userdel user_name`
- More about etc, password,... at [The new boston](https://youtu.be/7cRaGaIZQlo)
