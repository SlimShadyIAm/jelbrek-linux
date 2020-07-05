# Jelbrek-Linux (2.0)

---
**Note:** I am not associated with Everse or Jelbrek.icu. I made this in my own free time because I was bored. Decide for yourself whether you trust it or not.

---

This guide will use `maim` as the screenshot application. Install that, along with the following dependencies:

-   `jq`
-   `xsel`
-   `curl`
-   `notify-send` (on Arch the package for this is called `libnotify`)

Once you have installed the dependencies, you need to set your Jelbrek token up as an environment variable. You can do this as follows:

1.  Create a file under `/etc/profile.d/jelbrek.sh`
2.  As the contents, write:

        export JELBREK_TOKEN="yourtokenhere"

3.  Save the file, then log out and back in

If you don't set up the token or the dependencies properly, you will get an error message.

---

## How to use

First install the dependencies listed above and then choose one of the below methods to install the script.

After that's done, you can either run `jelbrek` from a terminal, using the shortcut from your application launcher, or you can even bind a hotkey which executes the command for you! I won't tell you how to do this.

I haven't done a whole lot of error checking. If you run into issues contact me at SlimShadyIAm#9999 on Discord.

---

## Automatic installation

You can run the following command. If you like, you can inspect the script before running it by viewing the file `install.sh` in this repository.

    curl -L https://raw.githubusercontent.com/SlimShadyIAm/jelbrek-linux/master/install.sh | bash

### (auto) uninstall

Again, inspect the uninstall script in this repository if you want. It's called `uninstall.sh`

     curl -L https://raw.githubusercontent.com/SlimShadyIAm/jelbrek-linux/master/uninstall.sh | bash

---

## Manual installation

Clone the repository. Create a file under `/usr/bin/jelbrek` and add the contents of the `jelbrek.sh` file from this repo.

Set this file as executable.

    chmod +x /usr/bin/jelbrek

Create file `/usr/share/applications/jelbrek.desktop` and write contents of `jelbrek.desktop` from this repo

### (Manual) uninstall

Remove the files you added before.

    sudo rm /usr/share/applications/jelbrek.desktop
    sudo rm /usr/bin/jelbrek
