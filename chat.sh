#/bin/bash

# login ------> 1
# add ------> 2
# delete ------> 3
# signup ------> 4
# logout ------> 5
# listfriend ------> 6
# sendmessage ------> 7


echo "Sign in..."
echo "Enter username. (For Sign Up type helloworld)"
read username
if [[ $username != "helloworld" ]]; then
	echo "Enter password"
	read password
	link="http://allscript.org/labs/chaterelo/chatti.php?op=log&uname=$username&pass=$password"
	#link="http://allscript.org/labs/chaterelo/chattipost.php"
	clear
	python3 req.py 1 $link
	a=$( cat responses.txt | head -n 1 | awk '{ print $3 }' | tail -c 5 | head -c 2 )
	b=$( cat responses.txt | tail -n 1 | awk '{ print $3 }' | tail -c 9 | head -c 6 )
	if [ $a == "ok" ] && [ $b == "logged" ]; then
		c=29392
	fi
	cat responses.txt
	sleep 3
	rm responses.txt
	if [[ $c == 29392 ]]; then
		login="http://allscript.org/labs/chaterelo/chatti.php?op=log&uname=$username&pass=$password"
		while :
		do
			clear
			echo "Type your request.(Example: addfriend, deletefriend, sendmessage, logout.)"
			read want
			if [[ $want == "addfriend" ]]; then
				echo "Type your friends username."
				read friend
				add="http://allscript.org/labs/chaterelo/chatti.php?op=addfriend&uname=$friend"
				python3 req.py 2 $login $add
				sleep 4
			elif [[ $want == "deletefriend" ]]; then
				echo "Type your friends username."
				read dfriend
				del="http://allscript.org/labs/chaterelo/chatti.php?op=deletefriend&uname=$dfriend"
				python3 req.py 3 $login $del
				sleep 4
			elif [[ $want == "logout" ]]; then
				python3 req.py 5 $link "http://allscript.org/labs/chaterelo/chatti.php?op=logout"
				sleep 3
				clear
				echo "See you..."
				sleep 3
				sl
				break 
			elif [[ $want == "listfriend" ]]; then
				python3 req.py 6 $link "http://allscript.org/labs/chaterelo/chatti.php?op=friendlist"
				cat friendlist.txt
				echo "For go back type q and press enter."
				read adam
				if [[ $adam == "q" ]]; then
					rm friendlist.txt
				fi
			elif [[ $want == "sendmessage" ]]; then
				echo "Type your friends username."
				read adam
				echo "Type your message."
				read newmessage
				send="http://allscript.org/labs/chaterelo/chatti.php?op=sendmessage&uname=$adam&message="$newmessage""
				python3 req.py 7 $link $send
			else
				echo "Unidentified request"
				sleep 1
			fi
		done
	elif [[ $c == 29392 ]]; then
		echo "There is a problem bro"
		bash test.sh
	fi	
elif [[ $username == "helloworld" ]]; then
	clear	
	echo "Sign up..."
	echo "Enter username."
	read un
	echo "Enter password."
	read pw
	link="http://allscript.org/labs/chaterelo/chatti.php?op=reg&uname=$un&pass=$pw"
	python3 req.py 4 $link 
	sleep 10
	for (( i = 0; i < 1000; i++ )); do
		echo "Proccesing..."
		sleep 0.001
		clear
	done
	clear
	echo "You are redirect in login page..."
	sleep 3
	bash chat.sh
fi

