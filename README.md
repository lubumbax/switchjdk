# switchjdk

switchjdk is a simple shell script aimed to ease switching between different JDK's.
When switching to a JDK, it does two main things:
* set JAVA_HOME.
* edits your PATH variable and replaces the old 'JAVA_HOME/bin' by the new one. 

## How to install

Download `common_functions.sh` and put it in a directory that is in your PATH (eg `/usr/local/sbin`).
Download `switchjdk.sh` and put it in a directory that is in your PATH (eg `/usr/local/sbin`).
Edit `switchjdk.sh` and configure it to switch your installed JDKs.


