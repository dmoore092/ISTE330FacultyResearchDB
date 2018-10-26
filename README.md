# ISTE330FacultyResearchDB
Final Project for ISTE-330

Welcome!

Guide for how to use GitHub
Note: I'm writing this from the perspective of a Mac/Linux user, from a commandline. It's what I am most familiar with. 
I will attempt to get the Windows process down as well, but I'm willing to work with people if they are struggling

1. Install git. https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
2. log into the github website, navigate to our repo
3. Click the bright green "Clone or Download" button.
4. Copy the link.
5. Open a terminal in Mac.
   Open Git-for-Windows/Git Bash in Windows.
6. Navigate ONE FOLDER UP from where you want the repo to be placed. The cloning process will create a folder on your local machine
7. Type `git clone https://github.com/dmoore092/ISTE330FacultyResearchDB.git`   (that's our real link btw)
8. Yay you're done. Now you can work in your favorite IDE, just DONT MOVE THIS FOLDER.


Pull, Commit, Push. Here is a standard, basic git workflow
1. Open a terminal/Git-For-Windows. Navigate to your git repo folder
2. Type `git pull`
3. This will pull down ALL of the repo to your local machine, including the changes other people made while you weren't working.
4. Note: YOU MUST PULL BEFORE YOU START WORKING! This ensures you're working off the most up-to-date copy of the project
5. Work.
6. When done working, you need to commit your work to your local repo, along with a commit message telling us what you did.
7. Type `git commit -am "I worked on the furgl part, and got it working. I am still working on the brajk part."`
8. -a commits all files that have been changed in this session, -m adds a message. Git will yell at you if you don't add a message
9. Next you need to push your changes to the remote repo for other people to get.
10. Type `git commit push`

Conflict. What if git yells at you that there is a merge conflict?
1. When you push, git will yell at you that you are out of sync with the rest of the project.
2. Reopen the file in question, you will see a very noticable addition of stars surrounding the section with conflicts.
3. You need to manually fix the problem. Git isn't magic and won't fix merge conflicts for us. You can delete your additions if you aren't sure which one is better, and add it after discussion with the team.
4. Commit, Push again. Rinse and repeat.
