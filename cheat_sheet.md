# CHEAT SHEET
-----------------

## Terminal tips
#### home
- `~` or `$HOME` = `/Users/<username>` AKA your home directory
- Use these shortcuts instead of going through `/Users/<username>` every time
- <details>
  <summary> EXAMPLES </summary>

    ```
    ls ~/
    cd $HOME/Documents
    ```

    </details>
#### tab
- use tab once to finish the name of
  - files, (In terminal - write half of any file name in current directory and hit tab)
  - directories, (write `cd ~/Doc` and hit tab)
  - commands (write `pbco` and hit tab)
- use tab twice to print out possible options (`cd ~/D` or `ad` and hit tab twice)

#### ctrl + c
- `ctrl + c` = tells the terminal to send a SIGINT to the current foreground process, which by default translates into terminating the application (terminate process)
#### ctrl + d
- `ctrl + d` = tells the terminal that it should register a EOF on standard input, which bash interprets as a desire to exit (terminate session)

## Terminal commands
#### man
- `man <command>` = prints out manual for any command. Not all commands have manuals
- press `q` to quit
- press `space` to scroll down the manual
- <details>
  <summary> EXAMPLES </summary>

    ```
    man ls
    man cd
    man ruby
    ```

    </details>
#### ls
- `ls` = list elements in current directory
#### pwd
- `pwd` = return working directory name (AKA - where I am currently)
#### cd
- `cd` = change directory
- <details>
  <summary> EXAMPLES </summary>

    ```
    cd ~/Documents
    cd ./some_folder/
    cd ../previous_folder/something/something
    ```

    </details>
#### touch
- `touch <new file name and extention` = create new file
- <details>
  <summary> EXAMPLES </summary>

    ```
    touch new_text_file.txt
    touch ~/Documents/ruby_file.rb
    touch script.sh
    ```

    </details>
#### mkdir
- `mkdir <new directory name>` = create a new directory named in the current path
- <details>
  <summary> EXAMPLES </summary>

    ```
    mkdir new_dir
    mkdir new_dir/another_new_dir
    mkdir ~/Documents/OneMoreNewDirectory
    ```

    </details>
#### cat
- `cat <file name>` = prints out contents of selected file
- <details>
  <summary> EXAMPLES </summary>

    ```
    cat this_file.txt
    cat ~/.bash_profile
    cat ../script.sh
    ```

    </details>
#### rm
- `rm <file name>` = remove chosen file
- `rm -rf <directory name>` = remove chosen directory
- <details>
  <summary> EXAMPLES </summary>

  ```
  rm text_file.txt
  rm some_file.sh
  rm -rf ./this_folder
  rm -rf Documents/useless_dir
  ```

  </details>

#### mv
- `mv <source> <target>` = moves source file or directory to target location
- Can be used to rename the source
- <details>
  <summary> EXAMPLES </summary>

  ```
  mv file.txt ~/Documents/ # moving file.txt to Documents
  mv file.txt ~/Documents/file.txt # same, moving file.txt to Documents
  mv file.txt ~/Documents/new_name.txt # moving file.txt to Documents but renaming it new_name.txt
  mv file.txt new_name.txt # not moving, only renaming file.txt to new_name.txt
  mv dir ~/Documents/ # moving dir to Documents
  mv dir ~/Documents/dir # same, moving dir to Documents
  mv dir ~/Documents/new_dir_name # moving dir to Documents and renaming it to new_dir_name
  mv dir new_dir_name # not moving, only renaming dir to new_dir_name
  ```

  </details>

#### cp
- `cp <source> <target>` = copies source file to target
- target copy can be named differently
- <details>
  <summary> EXAMPLES </summary>

  ```
  cp file.txt ~/Documents/ # copying file.txt to Documents
  cp file.txt ~/Documents/file.txt # same, copying file.txt to Documents
  cp file.txt ~/Documents/new_name.txt # copying file.txt to Documents but naming the copy new_name.txt
  cp file.txt new_name.txt # copying file.txt to the same directory but with a different name new_name.txt
  ```

  </details>
- `cp -R <source_dir> <target_dir>` = copies source directory and all its contents to target
- target copy can be named differently
- <details>
  <summary> EXAMPLES </summary>

  ```
  cp -R dir ~/Documents/ # copying dir to Documents
  cp -R dir ~/Documents/dir # same, copying dir to Documents
  cp -R dir ~/Documents/new_dir_name # copying dir to Documents and renaming it to new_dir_name
  cp -R dir new_dir_name # copying dir to the same path but with a different name new_dir_name
  ```

  </details>

#### clear
- `clear` = clears the terminal screen

#### export
- TODO

#### locate
- `locate <pattern>` = TODO

#### history
- TODO

#### grep
- TODO

#### ps (ps aux)
- TODO

#### pbcopy
- `pbcopy < <file>` = copying file contents to the pasteboard (the Clipboard) from command line
- <details>
  <summary> EXAMPLES </summary>

  ```
  pbcopy < file.txt
  pbcopy < script.sh
  pbcopy < ~/.ssh/id_rsa # copying your SSH key contents into clipboard
  ```

  </details>

#### which
- `which <command>` = prints out path to the chosen command
- <details>
  <summary> EXAMPLES </summary>

    ```
    which android
    which ruby
    which rvm
    which cucumber
    which ls
    which appium
    which chromedriver
    ```

    </details>
- If something is installed but terminal says `<command>: command not found`, then probably the path is not set correctly in the `~/.bash_profile` <-- THIS SHOULD BE UNDER ANOTHER CATEGORY. MAYBE EXPORT..
- You can check if you're using the correct executor of some command by running `which <command>`, for example, you can check if you're really using the chromedriver you just added in your path by running `which chromedriver` or check if you're using the ruby installed by rvm by running `which ruby` (it should be under `.rvm` dir if installed by rvm)

## SETUP FOR MOBILE TEST AUTOMATION WITH APPIUM & RUBY
#### 1. Read the output of every command. Check for errors before proceeding to the next step!
#### 2. Google the error messages you don't understand! (When googling add the name of the thing you were trying to install and use `sudo` / `rm -rf` / `chmod` commands ONLY AS LAST RESORT, or better not at all)

#### Brew
Package manager for OSX
- Check if brew installed: `brew -v`
- Install if not installed: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

#### Git
- Check if git installed: `git --version`
- Install if not installed `brew install git`

#### adb
- `brew install homebrew/cask/android-platform-tools`

#### rvm
Instructions taken from https://rvm.io/rvm/install.
Check it out for more info on the commands.
- Check if rvm is installed: `rvm -v`
- If not, do following commands
- `brew install gnupg gnupg2`
- `gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB`
- `\curl -sSL https://get.rvm.io | bash -s stable`
- `source ~/.bash_profile` (or just open new terminal window)
- Check if rvm was successfully installed: `rvm -v`

Now that you have ruby version manager (rvm), you can manage ruby versions (duh)
- Check what ruby versions you have: `rvm list`
- To install and make it default: `rvm install 2.4.1 --default`
- Check if ruby 2.4.1 is installed and set to default: `rvm list`


#### Android Studio
- To check if you already have Android Studio, press cmd+space, type Android Studio
- If not, do the following:
- https://developer.android.com/studio
- Download Android Studio
- Open it
- Do not import settings
- Install Standard

#### JDK
- Check if you already have java installed: `java -version`
- Check if you already have JDK: `ls /Library/Java/JavaVirtualMachines/`
- If not, do the following:
- https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html
- jdk-11.0.2_osx-x64_bin.dmg
- Download & open

#### add to path JDK & Android SDK
- Check if your JDK and Android SDK is installed in the same place as in these instructions (if not, find where you installed it and change the JAVA_HOME & ANDROID_HOME variables to your paths):
  - JDK is probably here: `/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home` (but the version might be different, change)
  - Android SDK is probably here `~/Library/Android/sdk/`
- `open ~/.bash_profile`
- Add at the end of your bash_profile: (but please make sure those JDK and Android SDK paths actually exist. check with `cd` or `ls`, like `ls /Library/Java/JavaVirtualMachines/`)
  ```
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home
  export PATH=$PATH:$JAVA_HOME
  export PATH=$PATH:$JAVA_HOME/bin

  export ANDROID_HOME=~/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME
  export PATH=$PATH:$ANDROID_HOME/emulator
  export Path=$PATH:$ANDROID_HOME/platform-tools
  ```
- Don't forget to save the file before closing
- To activate your changes: `source ~/.bash_profile`
- Connect your device and check if you see its ID: `adb devices`

#### appium
Appium is a popular mobile test automation tool
- To check if you already have Appium: `appium -v`
- If not, do the following:
- `brew install node` (CHECK ERRORS!!! Read the output, errors are not highlighted. Check if linked properly before proceeding. Run the suggested commands, google the errors if nothing is suggested)
- `npm install -g appium`
- `npm install wd`
- Check if appium is successfully installed now: `appium -v`
- If everything was done successfully, but it shows "appium: command not found", check where the appium actually was installed (check the installation command output). Usually it's under `/usr/local/bin/`, then it's already added to your $PATH variable and you can execute `appium` like any other command. `echo $PATH` to see your current paths. But if it's somewhere like `/usr/local/Cellar/node/11.12.0/bin/appium` then you have to manually add that path to your variable. Open ~/.bash_profile and add `export PATH=$PATH:/usr/local/Cellar/node/11.12.0/bin/`. Save, close, `source ~/.bash_profile` to update.

#### appium-doctor
appium-doctor helps us understand if everything is set up correctly for the automation
- To check if it's installed: `appium-doctor --version`
- If not, do the following:
- `npm install appium-doctor -g`
- `appium-doctor --android` (This is the command that will show you if you did the previous steps successfully. Fix errors, leave the warnings. Run the command again to check if everything is fixed. Ignore warnings about these libraries: opencv4nodejs, ffmpeg, bundletool)
