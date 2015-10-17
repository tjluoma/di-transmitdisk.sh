#!/bin/zsh -f
# Download and install Transmit Disk
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2015-10-16

	# Where do you want the pkg downloaded to?

DIR="$HOME/Downloads"


	## Normally the file you want is at
	## https://download.panic.com/transmit/Transmit%20Disk.pkg
	## but see https://library.panic.com/general/mac/el-capitan/
	## This new version of Transmit Disk is compatible with OS X 10.9.5 and later.

URL='https://download.panic.com/transmit/Transmit%20Disk%204.4.9.pkg'

NAME="$0:t:r"

	# create the filename by referencing the last part of the URL
	# and putting it into the DIR referenced above
FILE="$DIR/$URL:t"

	# Download the pkg from the URL
	# (If it already exists and is fully downloaded, curl will give a harmless error)
curl --continue-at - --fail --location --progress-bar --output "$FILE" "$URL"

	# This is where it actually gets installed.
	# Note the lack of 'sudo' - this is intentional
installer -pkg "$FILE" -target CurrentUserHomeDirectory -lang en 2>&1

	# make sure the `installer` worked
EXIT="$?"

if [ "$EXIT" = "0" ]
then
	echo "$NAME: Successfully installed $FILE"

	exit 0


else
	echo "$NAME: failed to install $FILE"

	exit 1
fi


exit 0
#
#EOF
