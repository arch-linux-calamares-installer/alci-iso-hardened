#!/bin/bash

# Create a temporary file with the desired content
cat <<EOL >/tmp/lsb-release
DISTRIB_ID=QalaaLinux
DISTRIB_RELEASE="rolling"
DISTRIB_DESCRIPTION="QalaaLinux"
EOL

# Move the file to /etc with appropriate permissions
sudo mv -f /tmp/lsb-release /etc/lsb-release

# Verify that the file has been moved and contains the correct content
if [ -f /etc/lsb-release ]; then
	echo "/etc/lsb-release created successfully with the following content:"
	cat /etc/lsb-release
else
	echo "Failed to create /etc/lsb-release"
fi
