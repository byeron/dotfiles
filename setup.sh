output=$(echo $PASSWORD | sudo -kS echo 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
	echo "The password is incorrect"
	exit 1
fi

echo $PASSWORD | sudo -kS apt update
