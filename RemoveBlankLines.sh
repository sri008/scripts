# Remove the empty lines in given file
# Using sed command
# ^ denotes to start of the line and $ end of the line
# d delete
#  -i parameter to write on file
#
#!/bin/sh

sed -i '/^$/d' $1
