#!/bin/bash
# setjdk.sh - Set a JDK
# juancarlos.muro@valtech.nl

# As we can not export variables from running a script, we have to 'source' this script (eg: . setjdk.sh 7)

#JDK_7=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
#JDK_8=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
JDK_7=$(/usr/libexec/java_home -v1.7)
JDK_8=$(/usr/libexec/java_home -v1.8)
OJDK_8=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
OJDK_11=/usr/local/opt/openjdk@11
OJDK_13=/usr/local/opt/openjdk@13
OJDK_14=/Library/Java/JavaVirtualMachines/openjdk-14.0.1.jdk/Contents/Home

. /usr/local/sbin/common_functions.sh

case $1 in
	7  ) export JAVA_HOME=$JDK_7 ;   replace_or_add_to_path "*jdk*\/bin" "$JDK_7/bin"   ; echo "JDK 7 is active now!" ;;
	8  ) export JAVA_HOME=$OJDK_8 ;  replace_or_add_to_path "*jdk*\/bin" "$OJDK_8/bin"  ; echo "OpenJDK 8 is active now!" ;;
	11 ) export JAVA_HOME=$OJDK_11 ; replace_or_add_to_path "*jdk*\/bin" "$OJDK_11/bin" ; echo "OpenJDK 11 is active now!" ;;
	13 ) export JAVA_HOME=$OJDK_13 ; replace_or_add_to_path "*jdk*\/bin" "$OJDK_13/bin" ; echo "OpenJDK 13 is active now!" ;;
	14 ) export JAVA_HOME=$OJDK_14 ; replace_or_add_to_path "*jdk*\/bin" "$OJDK_14/bin" ; echo "OpenJDK 14 is active now!" ;;
	*  ) echo "Unknown version $1. Please specify one of: 7, 8, 11, 13, 14"
esac
