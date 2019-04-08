# common_functions.sh - Common shell functions
# juancarlos.muro@valtech.nl

# Replaces entries from the PATH
# $1 - case pattern matching the path to replace (eg. "*jdk\/*\/bin")
# $2 - new value of the path entry (eg. "/new/jdk/bin")
function replace_in_path {
	TMP_PATH=""
	IFS=":"
	for entry in $PATH ; do
		case $entry in
		$1 ) if [ -z "$TMP_PATH" ] ; then TMP_PATH="${2}" ; else TMP_PATH="${TMP_PATH}:${2}" ; fi ;;
		* )  if [ -z "$TMP_PATH" ] ; then TMP_PATH="${entry}" ; else TMP_PATH="${TMP_PATH}:${entry}" ; fi ;;
		esac
	done
	IFS=" "
	export PATH="${TMP_PATH}"
}

# Removes entries from the PATH
# $1 - case pattern matching the path to remove (eg. "*jdk\/*\/bin")
function remove_from_path {
	NEW_PATH=""
	IFS=":"
	for entry in $PATH ; do
		case $entry in
		$1 ) ;;
		* )  if [ -z "$NEW_PATH" ] ; then NEW_PATH="${entry}" ; else NEW_PATH="${NEW_PATH}:${entry}" ; fi ;;
		esac
	done
	IFS=" "
	export PATH="${NEW_PATH}"
}

# Replaces an entry from the PATH.
# If the entry is not found in the PATH it is just added to the beginning.
# If the entry is found, all matches are remoed and then the new entry is added.
# $1 - case pattern matching the path to replace (eg. "*jdk\/*\/bin")
# $2 - new value of the path entry to add (eg. "/new/jdk/bin")
function replace_or_add_to_path {
        case $PATH in
        *$1* ) replace_in_path "$1" "$2" ;;
        * )    export PATH=${2}:$PATH ;;
        esac
}

