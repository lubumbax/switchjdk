# switchjdk

switchjdk is a simple shell script aimed to ease switching between different JDK's.
When switching to a JDK, it does two main things:
* set JAVA_HOME.
* edits your PATH variable and replaces the old 'JAVA_HOME/bin' by the new one. 

## How to install

Download `common_functions.sh` and put it in a directory that is in your PATH (eg `/usr/local/sbin`).
Download `switchjdk.sh` and put it in a directory that is in your PATH (eg `/usr/local/sbin`).
Edit `switchjdk.sh` and configure it to switch your installed JDKs.

## How to use

Just invoque `switchjdk.sh 11` (or whatever numbers you have configured).

To make it more confortable I added a few aliases to my environment:

```
$ vi ~/.bash_profile

  # Easily switch JDKs for the current Bash session
  alias jdk7='. setjdk.sh 7'
  alias jdk8='. setjdk.sh 8'
  alias jdk11='. setjdk.sh 11'
```

Then from the command line you just need to run `jdk8`, `jdk11`, ... in order to switch.
