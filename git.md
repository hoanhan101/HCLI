# `git`

### `init` & `add` & `commit`
- Congif: `git config --global user.name "Hoanh An"'`
- Help: `git command_name --help`
- Init: `git init`
- Track a specific file: `git add file_name`
- Track directory: `git add .`
- List all files, including hidden files: `ls -a` 
- Gitignore: Save as .gitignore
- Commit: `git commit -m 'some message`
- Add and commit: `git commit -a -m 'some message'`
- Status: `git status`
- See what have changes: `git diff`
- Can use `git add` to stage a file
- Stop tracking a file: `git rm -f file_name`
- Log: `git log`
- Log in one line: `git long --pretty=online`

### `pull` & `push` & `clone`
- List of commits waiting to be pushed: `git cherry -v`
- List remote: `git remote -v`
- Pull: `git pull some_link'
- Push: `git push`, explicitly `git push origin master`
- Tag: `git tag -a v0 -m 'some message'`
- Push tag: `git push tag_name`
- Push all tags: `git push --tags`
- Git clone: `git clone some_link`

### `branch`
- Create a branch `git branch branch_name`
- Switch to a branch `git checkout branch_name`
- Create a new branch and switch to it: `git checkout -b branch_name`
- Checkout to master and see merged branch or unmereged branch: `git branch --merged` | `git branch --no-merged` 
- Merge a branch: `git merge branch_name`
- Delete merged branch: `git branch -d branch_name`
- Delete unmerged branch: `git branch -D branch_name`
- Mergetool: `git mergetool`
- Rebase - moving the base of a branch onto a different position: `git rebase master`
- Revert - undo, Reset, Clean

### `ssh`
- Generate ssh key: `ssh-keygen -t rsa -C email_address`
- More at [Derek Banas](https://youtu.be/IYo-NoyvtQg)

### `github pages`
- More at [The Coding Train](https://youtu.be/bFVtrlyH-kc)
