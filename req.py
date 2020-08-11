from bs4 import BeautifulSoup, SoupStrainer
import requests
import sys

reqtype = sys.argv[1]
link = sys.argv[2]
statuslink = 'http://allscript.org/labs/chaterelo/chatti.php?op=status'
#statuslink = 'http://allscript.org/labs/chaterelo/chattipost.php'

if int(reqtype) == 1: 
	r1 = requests.post(link)
	r2 = requests.post(statuslink, cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	sys.stdout=open("responses.txt","w")
	print("Signin response: ", soup1)
	print("Status response: ", soup2)
	sys.stdout.close()
	"""
	session1 = requests.Session()
	r1 = session1.post(link, data="{'op':'log', 'uname':'deneme', 'pass':'123123'}")
	session2 = requests.Session()
	r2 = session2.post(statuslink, cookies=r1.cookies, data="{'op':'status'}")
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	sys.stdout=open("responses.txt","w")
	print("Signin response: ", soup1)
	print("Status response: ", soup2)
	sys.stdout.close()
	"""
elif int(reqtype) == 2:
	add = sys.argv[3]
	r1 = requests.post(link)
	r2 = requests.post(add,cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	print("Adding response: ", soup2)
elif int(reqtype) == 3:
	delete = sys.argv[3]
	r1 = requests.post(link)
	r2 = requests.post(delete,cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	print("Deleting response: ", soup2)
elif int(reqtype) == 4:
	signup = sys.argv[2]
	r1 = requests.post(signup)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	print("Signup response: ", soup1)
elif int(reqtype) == 5:
	logout = sys.argv[3]
	r1 = requests.post(link)
	r2 = requests.post(logout,cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	print("Logout response: ", soup2)
elif int(reqtype) == 6:
	listfriends = sys.argv[3]
	r1 = requests.post(link)
	r2 = requests.post(listfriends,cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	sys.stdout=open("friendlist.txt","w")
	print("Listfriends response: ", soup2)
	sys.stdout.close()
elif int(reqtype) == 7:
	newmessage = sys.argv[3]
	r1 = requests.post(link)
	r2 = requests.post(newmessage,cookies=r1.cookies)
	data1 = r1.text
	soup1 = BeautifulSoup(data1,"html.parser")
	data2 = r2.text
	soup2 = BeautifulSoup(data2,"html.parser")
	print("Message send response: ", soup2)

