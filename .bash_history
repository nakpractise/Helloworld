which wget
sudo yum install wget
sudo su -
shareimprove this answer
edited Mar 2 '13 at 18:40
answered Apr 22 '12 at 14:04
thejartender
5,10262646
1
This answer assumes that you are using Linux, and that you want to install it in a non-standard way / place, and a bunch of other things. A better answer would be "just follow the installation instructions on the download website" ... unless you are using Ubuntu, in which case there are other ways to do it. – Stephen C Jun 5 '12 at 9:41 
7
And how's it odd that the answer assumes Linux when the question title includes Linux? The sceipt is not a one-size-fit-all given that Linux itself is not such. Gi
4
Fu
add a comm
u
6
down vote
latest tested,
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=htt

Be aware that 

shareimprove this answer
answered Jun 25 '13 at 6:55

Jason Xu
1,24721743
This worked for me. – ramirezag Mar 5 '14 at 2:01
add a comment
up vote
6
down vote
For those needing JCE8 as well, you can download

curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip
Or

wget --no-check-certificate -c 
shareimprove this
answered 

Cole 
1,81611311
add a com
u
5
down
This works for the JDK 6, you just need to replace the download url with the latest version.

wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%
shareimprove th
edited 
an
Hiro2k
3
This works but I couldn't
On 2013-11-02, could not have this to work. Downloads a HTML registration page instead of the file. – Stéphane Gourichon N
add a comment
up vot
3
down vote
All of the abo

Oracle provide persistent links to the latest updates of each Java version as documented at https://support.oracle.com/epmos/faces/DocumentDisplay?_afrLoop=397248601136938&id=1414485.1 - though you need to create/log in to an Oracle Support account. *Otherwise you can only access the last "public" update of each Java version, e.g. 1.6_u45 (Mar 2013; Latest update is u65, Oct 2013)*

Once you know the persistent link, you should be able to resolve it to the real download; The following works for me

ME=<myOracleID>
PW=<myOr
PATCH_FILE=p13079846_1

echo "G

wget -
-
h
patch_file=$PATCH_FILE

wait    # wget appears to go into background, so "wait" waits 
        # until all background processes complete

REALURL=`grep "^--" getrealurl.out |tail -1 |sed -e 's/.*http/http/'`
wget -O $PATCH_FILE $REALURL
#These last 
#cookie on it and I've had 
s
edited Jan 13
answere
t
312
add a
up vote
3
down vote
As already posted here: https://stackoverflow.com/a/41718895/4370196
Update for JDK
Since Oracle inserted some md5hash in their do
So I tinkered some nasty bash command line to get the latest jdk download
wget -q http://www.oracle.com/technetwork/java/javase/downloads/index.html -O ./index.html && grep -Eo
The bold part should be replaced by the package of your liking.
shareimprove this answer
edited May 23 '1

Community♦
11
answered Jan 1

Ben Herfurth
13616
Yes, it is not so easy any
add 
up vote
3
down vote
Instead of using for every new Java version a new link or ch

I've used a somehow triv
#!/bin/bash
### Proxy settings
# If there is
PROXY
PROXY_TYPE="--
U
PASS='p

### Find out the links 
# To do so

BASE_U

# 

BASE_URL

# 

JAVA_ENVIRONMENTS=("JRE" "JDK") # ! yet "SERVER-JRE"

for JAVA_ENVIRONMENT in "${JAVA_ENVIRONMENTS[@]}"
do

echo
echo "JAVA_ENVIRONMENT="$JAVA_ENVIRONMENT
echo

for (( JAVA_BASE_VERSION = 8; JAVA_BASE_
do

echo "JAVA_BAS
### "Read the page"
# and follow the links for the package intereste
DOWNLOAD_SITE="$(echo $BASE_URL_OUTPUT | grep -m 1 -io "${JAVA_ENVIRONMENT}$
echo "

### Gather the neces
# To do so, following the link
# reading and accept the license 
# 
# ... the greedy regular expression is to
# and already prepared for OR .gz files 

DOWNLO

# and echo out the l

echo "DOWNLOAD_LINK_OUTPUT="$DOWNLOAD_LINK_OUTPUT

done

done
Since the download links are available now, one may proceed further with wget or curl.

shareimprove this answer
edited Apr 30 at 19:52
answered Apr 11 at 16:29

U880D
764919
add a
up vote
3
down vote
Java SE Devel

TAR GZ:

wget --no-cookies --no-check-certificate --h
RPM:

wget --
shareimpro
a

Juan Pablo G
17319
add a comment
up vote
2
down vote
I solve this (for Debian based Linux distros) by making packages using java-package a few times (for various architectures), then distributing them internally.

The big plus side is that this method always works; no matter how crazy Oracle's web pages become. Oracle can no longer break my build!

The downside is that it's a bit more work to set up initially.

Download the tar.gz files manually in a browser (thus "accepting" their terms)
Run make-jpk
D
Fo

passphras
g
 
Of course

... Oracle gr

On the receiving end, if you have a password protected apt repo, all you need to do is apt-get install it. If you have raw packages, download, decrypt and dpkg -i them. Works like a charm!

shareimprove this answer
answered Apr 22 '14 at 9:51

mogsie
3,1172025
2
so this is how it was implemented honoring the license. This is awesome :-) – Kowser Apr 22 '14 at 23:30
add a comment
up vote
2
down vote
I've made a jdk-download script (specific for the tar.gz) for my gentoo boxes. Doesn't need to be updated like other similar scripts, trying to "brute-force" download the latest build for whatever version you want.

USAGE

jdk-download< <version> <platform> [<build>]

* <version> - Something like "8
* <platform> - 
* <buil
Bl

Source

shareimprove this answer
answered May 19 '15 at 11:55

Fabio Bonfante
4,32212232
add a comment
up vote
2
down vote
wget This Worked for me JDK8

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2F%www.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
shareimprove this answer
answered Sep 24 '17 at 15:33

vvardhanz
550136
add a comment
up vote
2
down vote
The accepted answer was not working for me, as of 2017-04-25. However, the simple solution was using the -b flag instead of the --header option.

For example, to get jdk-1.8_131:

version='8u131'; wget -H -O jdk-$version-linux-x64.tar.gz --no-check-certificate --no-cookies -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/$version-b11/jdk-$version-linux-x64.tar.gz
That will execute in the background, writing output to wget-log.

shareimprove this answer
edited Oct 11 '17 at 19:24

Scott Dudley
2,50511123
answered Apr 25 '17 a

ILMostro_7
617
add a c
up
1
d
Try

wget --n
i

source: 

shareimprove this answer
answered Feb 9 '14 at 0:32

ssgao
1,653221
1
It seems, tha
add a comment
up vote
1
down vote
oracle-java-

It requires Linux, Docker and a JDK >= 8 to run.

shareimprove this answe
answered Nov 1 '17 at 0:28

aventurin
5791817
add a comment
up vote
1
down vote
wget --no-cookies --no-

shareimprove this answer
answered Jan 18 at 13:35

Роман 
�151
HTTP request sent, aw
add a comment
up vote
1
down vote
Context

I recently faced the same problem and although the comments on this page and some others provided helpful hints - I thought it would be good to document the steps I

System Details

I am following the PNDA set up on AW

https://github.com/pndaproject/pnda-guide/blob/develop/provisioning/aws/PREPARE.md
I am using ubuntu 14.04 [free tier eligible] on AWS cloud, and am running the code from 64 bit windows8.1 laptop. I am using PUTTY to connect to the server instance. I git cloned the pnda code from https://github.com/pndaproject/pnda to the ubuntu instance.

Important Note Please note that if you plan to use Ubuntu instance on AWS make sure it's 14.04 only. If you use version 16, it does not work. I learnt it the hard way!

Resolution Steps

As those who have gone as far as to have encountered the error being discussed here would know - the mirror creation file involves the following steps -

1) Run the script create_mirror.sh [ sudo su -s ./create_mirror.sh ] to run the full mirror creation process

2) This script in turn calls various other scripts - one of them being create_mirror_misc.sh; this script refers to pnda-static-file-dependencies.txt which has a list of files to be downloaded.

3) On the very first line of the pnda-static-file-dependencies.txt is a reference to download the jdk-8u131-linux-x64.tar.gz file from  http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz oraclelicense=accept-securebackup-cookie; It is at this point that my script was failing with the message Failed to download http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz after 3 retries

4) I browsed to the page http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz and found the following error message displayed **In order to download products from Oracle Technology Network you must agree to the OTN license terms**

5) To resolve this problem I made the following change to the pnda-static-file-dependencies.txt; I added --no-check-certificate --no-cookies to bypass the license term agreement condition

6) So the revised code looks like - http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz --no-check-certificate --no-cookies oraclelicense=accept-securebackup-cookie

I hope this is helpful.

shareimprove this answer
answered Feb 7 at 13:45

Stats_Lover
966
add a comment
up vote
1
down vote
you should try:

wget \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz \
        -O java.tar.gz
shareimprove this answer
answered Jun 13 at 8:26

Walterwhites
774
add a comment
up vote
1
down vote
this command can download jdk8 tgz package at now (2018-09-06), good luck !

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
shareimprove this answer
answered Sep 6 at 10:01

kite
314
add a comment
up vote
-3
down vote
sudo wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.rpm"
shareimprove this answer
answered Dec 6 '13 at 13:13

nmeegama
7118
3
Sudo ? Really ? – Det Mar 18 '14 at 18:40 
add a comment
up vote
-4
down vote
Why not click to download from your browser then copy & paste the exact link where it was downloaded, for example:

wget http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz?AuthParam=1380225131_dd70d2038c57a4729d8c0226684xxxx
You can find out the link by looking at the network tab of your browser after accepting terms in oracle and clicking to download. F12 in Chrome. Firebug in Firefox.

shareimprove this answer
edited Oct 7 '13 at 15:34
answered Sep 26 '13 at 19:53

jacktrades
3,397114272
1
Because people need this for automatic installation of java on servers with bash scripts. – Saša Šijak Nov 26 '13 at 10:15
1
What if you are on a different box or need to install by CLI? Yeah ... – ingyhere Oct 23 '14 at 19:27
add a comment
protected by Community♦ Jan 24 '15 at 2:04
Thank you for your interest in this question. Because it has attracted low-quality or spam answers that had to be removed, posting an answer now requires 10 reputation on this site (the association bonus does not count). 

Would you like to answer one of these unanswered questions instead?

Not the answer you're looking for? Browse other questions tagged java linux install wget or ask your own question.
asked

6 years, 4 months ago

viewed

344,412 times

active

5 days ago

We have 3 open jobs ♥SUSE
SUSE

Troy, MI

Computer SoftwarePrivate1-5k people
Our tech stack

linuxlinux-kernellinux-device-driverkubernetessaltrubypythondockercephopenstackopen-sourcedevopsagileangular-fullstack
We offer great benefits

 Truly international enviroment and working culture
 Good secondary benefits
 Collaborative Working enviroment
 Home, virtual office
Learn more
Linked
8
How do I download Oracle Java on Linux using wget / curl from shell?
90

wget
:



DOWNLOAD_SITE="$(echo $BASE_URL_OUTPUT | grep -m 1 -io "${JAVA_ENVIRONMENT}$
echo "

### Gather the neces
# To do so, following the link
# reading and accept the license 
# 
# ... the greedy regular expression is to
# and already prepared for OR .gz files 

DOWNLO

# and echo out the l

echo "DOWNLOAD_LINK_OUTPUT="$DOWNLOAD_LINK_OUTPUT

done

done
Since the download links are available now, one may proceed further with wget or curl.

shareimprove this answer
edited Apr 30 at 19:52
answered Apr 11 at 16:29

U880D
764919
add a
up vote
3
down vote
Java SE Devel

TAR GZ:

wget --no-cookies --no-check-certificate --h
RPM:

wget --
shareimpro
a

Juan Pablo G
17319
add a comment
up vote
2
down vote
I solve this (for Debian based Linux distros) by making packages using java-package a few times (for various architectures), then distributing them internally.

The big plus side is that this method always works; no matter how crazy Oracle's web pages become. Oracle can no longer break my build!

The downside is that it's a bit more work to set up initially.

Download the tar.gz files manually in a browser (thus "accepting" their terms)
Run make-jpk
D
Fo

passphras
g
 
Of course

... Oracle gr

On the receiving end, if you have a password protected apt repo, all you need to do is apt-get install it. If you have raw packages, download, decrypt and dpkg -i them. Works like a charm!

shareimprove this answer
answered Apr 22 '14 at 9:51

mogsie
3,1172025
2
so this is how it was implemented honoring the license. This is awesome :-) – Kowser Apr 22 '14 at 23:30
add a comment
up vote
2
down vote
I've made a jdk-download script (specific for the tar.gz) for my gentoo boxes. Doesn't need to be updated like other similar scripts, trying to "brute-force" download the latest build for whatever version you want.

USAGE

jdk-download< <version> <platform> [<build>]

* <version> - Something like "8
* <platform> - 
* <buil
Bl

Source

shareimprove this answer
answered May 19 '15 at 11:55

Fabio Bonfante
4,32212232
add a comment
up vote
2
down vote
wget This Worked for me JDK8

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2F%www.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
shareimprove this answer
answered Sep 24 '17 at 15:33

vvardhanz
550136
add a comment
up vote
2
down vote
The accepted answer was not working for me, as of 2017-04-25. However, the simple solution was using the -b flag instead of the --header option.

For example, to get jdk-1.8_131:

version='8u131'; wget -H -O jdk-$version-linux-x64.tar.gz --no-check-certificate --no-cookies -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/$version-b11/jdk-$version-linux-x64.tar.gz
That will execute in the background, writing output to wget-log.

shareimprove this answer
edited Oct 11 '17 at 19:24

Scott Dudley
2,50511123
answered Apr 25 '17 a

ILMostro_7
617
add a c
up
1
d
Try

wget --n
i

source: 

shareimprove this answer
answered Feb 9 '14 at 0:32

ssgao
1,653221
1
It seems, tha
add a comment
up vote
1
down vote
oracle-java-

It requires Linux, Docker and a JDK >= 8 to run.

shareimprove this answe
answered Nov 1 '17 at 0:28

aventurin
5791817
add a comment
up vote
1
down vote
wget --no-cookies --no-

shareimprove this answer
answered Jan 18 at 13:35

Роман 
�151
HTTP request sent, aw
add a comment
up vote
1
down vote
Context

I recently faced the same problem and although the comments on this page and some others provided helpful hints - I thought it would be good to document the steps I

System Details

I am following the PNDA set up on AW

https://github.com/pndaproject/pnda-guide/blob/develop/provisioning/aws/PREPARE.md
I am using ubuntu 14.04 [free tier eligible] on AWS cloud, and am running the code from 64 bit windows8.1 laptop. I am using PUTTY to connect to the server instance. I git cloned the pnda code from https://github.com/pndaproject/pnda to the ubuntu instance.

Important Note Please note that if you plan to use Ubuntu instance on AWS make sure it's 14.04 only. If you use version 16, it does not work. I learnt it the hard way!

Resolution Steps

As those who have gone as far as to have encountered the error being discussed here would know - the mirror creation file involves the following steps -

1) Run the script create_mirror.sh [ sudo su -s ./create_mirror.sh ] to run the full mirror creation process

2) This script in turn calls various other scripts - one of them being create_mirror_misc.sh; this script refers to pnda-static-file-dependencies.txt which has a list of files to be downloaded.

3) On the very first line of the pnda-static-file-dependencies.txt is a reference to download the jdk-8u131-linux-x64.tar.gz file from  http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz oraclelicense=accept-securebackup-cookie; It is at this point that my script was failing with the message Failed to download http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz after 3 retries

4) I browsed to the page http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz and found the following error message displayed **In order to download products from Oracle Technology Network you must agree to the OTN license terms**

5) To resolve this problem I made the following change to the pnda-static-file-dependencies.txt; I added --no-check-certificate --no-cookies to bypass the license term agreement condition

6) So the revised code looks like - http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz --no-check-certificate --no-cookies oraclelicense=accept-securebackup-cookie

I hope this is helpful.

shareimprove this answer
answered Feb 7 at 13:45

Stats_Lover
966
add a comment
up vote
1
down vote
you should try:

wget \
        --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz \
        -O java.tar.gz
shareimprove this answer
answered Jun 13 at 8:26

Walterwhites
774
add a comment
up vote
1
down vote
this command can download jdk8 tgz package at now (2018-09-06), good luck !

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
shareimprove this answer
answered Sep 6 at 10:01

kite
314
add a comment
up vote
-3
down vote
sudo wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.rpm"
shareimprove this answer
answered Dec 6 '13 at 13:13

nmeegama
7118
3
Sudo ? Really ? – Det Mar 18 '14 at 18:40 
add a comment
up vote
-4
down vote
Why not click to download from your browser then copy & paste the exact link where it was downloaded, for example:

wget http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz?AuthParam=1380225131_dd70d2038c57a4729d8c0226684xxxx
You can find out the link by looking at the network tab of your browser after accepting terms in oracle and clicking to download. F12 in Chrome. Firebug in Firefox.

shareimprove this answer
edited Oct 7 '13 at 15:34
answered Sep 26 '13 at 19:53

jacktrades
3,397114272
1
Because people need this for automatic installation of java on servers with bash scripts. – Saša Šijak Nov 26 '13 at 10:15
1
What if you are on a different box or need to install by CLI? Yeah ... – ingyhere Oct 23 '14 at 19:27
add a comment
protected by Community♦ Jan 24 '15 at 2:04
Thank you for your interest in this question. Because it has attracted low-quality or spam answers that had to be removed, posting an answer now requires 10 reputation on this site (the association bonus does not count). 

Would you like to answer one of these unanswered questions instead?

Not the answer you're looking for? Browse other questions tagged java linux install wget or ask your own question.
asked

6 years, 4 months ago

viewed

344,412 times

active

5 days ago

We have 3 open jobs ♥SUSE
SUSE

Troy, MI

Computer SoftwarePrivate1-5k people
Our tech stack

linuxlinux-kernellinux-device-driverkubernetessaltrubypythondockercephopenstackopen-sourcedevopsagileangular-fullstack
We offer great benefits

 Truly international enviroment and working culture
 Good secondary benefits
 Collaborative Working enviroment
 Home, virtual office
Learn more
Linked
8
How do I download Oracle Java on Linux using wget / curl from shell?
90

wget
:


x
:
which wget
sudo su -
which wget
sudo su -
sudo su -
java version
java -version
mvn --version
jenkins version
jenkins --version
jenkins -version
which jenkins
ls
sudo su -
which git
git --version
git init
git config --global user.name "nakpractise"
git config --global user.email "vivekkadari89@gmail.com"
ls
cd javaproject
mkdir javaproject
cd javaproject
cd ..
which jenkins
jenkins version
jenkins status
sudo which jenkins
sudo systemctl start jenkins.service
jenkins version
jenkins --version
sudo jenkins --version
git --version
sudo su -
cd ..
cd 
su cd /var/lib/jenkins
sudo cd /var/lib/jenkins
cd /var/lib/jenkins
cd ..
clear
mkdir javaproject
mkdir java
mkdir project1
sudo mkdir project1
cd project1
cd ..
cd \Users\Vivek Kadari\Desktop\project1
cd project1
vi Hello.java
cd project1
ls
cd javaproject
sudo vi Hello.java
sudo javac Hello.java
sudo vi Hello.java
sudo javac Hello.java
sudo vi Hello.java
sudo javac Hello.java
sudo vi Hello.java
sudo javac Hello.java
ls
pwd
java Hello
cd /home/centos/javaproject
cd..
cd ..
sudo cd /var/lib/jenkins
java -jar jenkins.war
sudo cd /var/lib/jenkins
ls
cd /var/lib/jenkins
ls
cat config.xml
ls
cd users
ls
cd vivek
ls
cd ..
ls
vi config.xml
sudo vi config.xml
systemctl restart jenkins
sudo systemctl restart jenkins
sudo vi config.xml
cat config.xml
ls
cd users
ls
sudo vi config.xml
cd ..
sudo vi config.xml
sudo systemctl restart jenkins
cd ..
cd /home/centos/javaproject
ls
sudo javac Hello.java
java Hello
pwd
cd ..
pwd
javac Hello.java
ls
pwd
cd javaproject
pwd
cd ..
ls -l
chmod 755 javaproject
ls -l
man chmod
chmod 766 javaproject
ls -l
chmod 777 javaproject
ls -l
cd javaproject
git status
ls
git status
git add .
git commit
git commit -m "added hello world program"
git remote add origin git@github.com:nakpractise/Helloworld.git
git push -u origin master
git config --global user.name "nakpractise"
git config --global user.email "vivekkadari89@gmail.com"
git push -u origin master
git push -u origin master git@github.com:nakpractise/Helloworld.git
cd ..
git push -u origin master https://github.com/nakpractise/Helloworld.git
git init
git status
ls
git reset
git status
sudo ssh-keygen -t rsa
cd /root/.ssh/
sudo cd /root/.ssh/
ls
sudo su -
cd ..
sudo su -
sudo su -
sudo su -
git status
git add .
git commit -m
git commit
git remote add origin https://github.com/nakpractise/Helloworld.git
git push -u origin master
cd javaproject
git push -u origin master
ls
rm -rf *
ls
cd ..
ls
vi index.html
git status
git log
cd javaproject
sudo vi Hello.java
sudo javac Hello.java
ls
git status
