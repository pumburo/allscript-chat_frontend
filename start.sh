#/bin/bash
echo "1. Sign in."
echo "2. Sign up."
echo "3. status"
echo "Type 1,  2 or 3"
read firstreq
if [[ $firstreq == 1 ]]; then
	fr="log"
	echo "Enter Username"
	read username
	echo "Enter Password"
	read password
elif [[ $firstreq == 2 ]]; then
	fr="reg"
	echo "Enter Username"
	read username
	echo "Enter Password"
	read password
elif [[ $firstreq == 3 ]]; then
	fr="status"
fi

x="http://allscript.org/labs/chaterelo/chatti.php?op=$fr&uname=$username&pass=$password"

if [[ $fr == "status" ]]; then
	x="http://allscript.org/labs/chaterelo/chatti.php?op=$fr"
fi

echo "Link: $x"
read a
if [[ $a == 1 ]]; then
	python3 deneme.py $x
fi
