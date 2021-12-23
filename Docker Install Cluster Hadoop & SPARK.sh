PS C:\Users\elbaidoury> docker images
REPOSITORY                 TAG       IMAGE ID       CREATED        SIZE
hello-world                latest    feb5d9fea6a5   3 months ago   13.3kB
lamiakarim/hadoop-spark2   latest    d64a47823a96   2 years ago    1.94GB
PS C:\Users\elbaidoury> docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS          PORTS                                                                                                NAMES
f5e9f7753268   lamiakarim/hadoop-spark2   "sh -c 'service ssh …"   26 minutes ago   Up 26 minutes   0.0.0.0:8041->8042/tcp                                                                               hadoop-slave2
fa278d946109   lamiakarim/hadoop-spark2   "sh -c 'service ssh …"   26 minutes ago   Up 26 minutes   0.0.0.0:8040->8042/tcp                                                                               hadoop-slave1
ad4278e105e8   lamiakarim/hadoop-spark2   "sh -c 'service ssh …"   32 minutes ago   Up 32 minutes   0.0.0.0:7077->7077/tcp, 0.0.0.0:8088->8088/tcp, 0.0.0.0:16010->16010/tcp, 0.0.0.0:50070->50070/tcp   hadoop-master
PS C:\Users\elbaidoury> docker exec -it hadoop-master bash
root@hadoop-master:~# ./start-hadoop.sh


Starting namenodes on [hadoop-master]
hadoop-master: Warning: Permanently added 'hadoop-master,172.18.0.2' (ECDSA) to the list of known hosts.
hadoop-master: starting namenode, logging to /usr/local/hadoop/logs/hadoop-root-namenode-hadoop-master.out
hadoop-slave2: Warning: Permanently added 'hadoop-slave2,172.18.0.4' (ECDSA) to the list of known hosts.
hadoop-slave1: Warning: Permanently added 'hadoop-slave1,172.18.0.3' (ECDSA) to the list of known hosts.
hadoop-slave1: starting datanode, logging to /usr/local/hadoop/logs/hadoop-root-datanode-hadoop-slave1.out
hadoop-slave2: starting datanode, logging to /usr/local/hadoop/logs/hadoop-root-datanode-hadoop-slave2.out
Starting secondary namenodes [0.0.0.0]
0.0.0.0: Warning: Permanently added '0.0.0.0' (ECDSA) to the list of known hosts.
0.0.0.0: starting secondarynamenode, logging to /usr/local/hadoop/logs/hadoop-root-secondarynamenode-hadoop-master.out


starting yarn daemons
starting resourcemanager, logging to /usr/local/hadoop/logs/yarn--resourcemanager-hadoop-master.out
hadoop-slave1: Warning: Permanently added 'hadoop-slave1,172.18.0.3' (ECDSA) to the list of known hosts.
hadoop-slave2: Warning: Permanently added 'hadoop-slave2,172.18.0.4' (ECDSA) to the list of known hosts.
hadoop-slave1: starting nodemanager, logging to /usr/local/hadoop/logs/yarn-root-nodemanager-hadoop-slave1.out
hadoop-slave2: starting nodemanager, logging to /usr/local/hadoop/logs/yarn-root-nodemanager-hadoop-slave2.out


root@hadoop-master:~# hadoop fs -mkdir -p /input
root@hadoop-master:~# hadoop fs -ls
ls: `.': No such file or directory
root@hadoop-master:~# hadoop fs -put purchases.txt input
put: `input': No such file or directory
root@hadoop-master:~# hadoop fs -put purchases.txt /input
root@hadoop-master:~# hadoop fs -ls /
Found 1 items
drwxr-xr-x   - root supergroup          0 2021-12-23 09:13 /input
root@hadoop-master:~# hadoop fs -ls -R /
drwxr-xr-x   - root supergroup          0 2021-12-23 09:13 /input
-rw-r--r--   2 root supergroup  211312924 2021-12-23 09:13 /input/purchases.txt
root@hadoop-master:~# hadoop fs -tail /input/purchases.txt
31      17:59   Norfolk Toys    164.34  MasterCard
2012-12-31      17:59   Chula Vista     Music   380.67  Visa
2012-12-31      17:59   Hialeah Toys    115.21  MasterCard
2012-12-31      17:59   Indianapolis    Men's Clothing  158.28  MasterCard
2012-12-31      17:59   Norfolk Garden  414.09  MasterCard
2012-12-31      17:59   Baltimore       DVDs    467.3   Visa
2012-12-31      17:59   Santa Ana       Video Games     144.73  Visa
2012-12-31      17:59   Gilbert Consumer Electronics    354.66  Discover
2012-12-31      17:59   Memphis Sporting Goods  124.79  Amex
2012-12-31      17:59   Chicago Men's Clothing  386.54  MasterCard
2012-12-31      17:59   Birmingham      CDs     118.04  Cash
2012-12-31      17:59   Las Vegas       Health and Beauty       420.46  Amex
2012-12-31      17:59   Wichita Toys    383.9   Cash
2012-12-31      17:59   Tucson  Pet Supplies    268.39  MasterCard
2012-12-31      17:59   Glendale        Women's Clothing        68.05   Amex
2012-12-31      17:59   Albuquerque     Toys    345.7   MasterCard
2012-12-31      17:59   Rochester       DVDs    399.57  Amex
2012-12-31      17:59   Greensboro      Baby    277.27  Discover
2012-12-31      17:59   Arlington       Women's Clothing        134.95  MasterCard
2012-12-31      17:59   Corpus Christi  DVDs    441.61  Discover
root@hadoop-master:~# man nano
bash: man: command not found
root@hadoop-master:~# nano purchases
bash: nano: command not found
root@hadoop-master:~# apt-get install nano
Reading package lists... Done
Building dependency tree
Reading state information... Done
Suggested packages:
  spell
The following NEW packages will be installed:
  nano
0 upgraded, 1 newly installed, 0 to remove and 36 not upgraded.
Need to get 191 kB of archives.
After this operation, 700 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 nano amd64 2.5.3-2ubuntu2 [191 kB]
Fetched 191 kB in 0s (322 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package nano.
(Reading database ... 14864 files and directories currently installed.)
Preparing to unpack .../nano_2.5.3-2ubuntu2_amd64.deb ...
Unpacking nano (2.5.3-2ubuntu2) ...
Setting up nano (2.5.3-2ubuntu2) ...
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) in auto mode
update-alternatives: using /bin/nano to provide /usr/bin/pico (pico) in auto mode
root@hadoop-master:~# nano purchases
root@hadoop-master:~# nano purchases.txt
root@hadoop-master:~# nano file.txt
root@hadoop-master:~# ls
file.txt  purchases.txt   run-wordcount.sh  start-kafka-zookeeper.sh
hdfs      purchases2.txt  start-hadoop.sh
root@hadoop-master:~# hadoop fs -put file.txt /input
root@hadoop-master:~# hadoop fs -ls -R /
drwxr-xr-x   - root supergroup          0 2021-12-23 09:29 /input
-rw-r--r--   2 root supergroup         44 2021-12-23 09:29 /input/file.txt
-rw-r--r--   2 root supergroup  211312924 2021-12-23 09:13 /input/purchases.txt
root@hadoop-master:~# spark-shell
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
21/12/23 09:31:28 WARN yarn.Client: Neither spark.yarn.jars nor spark.yarn.archive is set, falling back to uploading libraries under SPARK_HOME.
21/12/23 09:32:31 WARN metastore.ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 1.2.0
21/12/23 09:32:31 WARN metastore.ObjectStore: Failed to get database default, returning NoSuchObjectException
21/12/23 09:32:33 WARN metastore.ObjectStore: Failed to get database global_temp, returning NoSuchObjectException
Spark context Web UI available at http://172.18.0.2:4040
Spark context available as 'sc' (master = yarn, app id = application_1640250254531_0001).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 2.2.0
      /_/

Using Scala version 2.11.8 (OpenJDK 64-Bit Server VM, Java 1.8.0_191)
Type in expressions to have them evaluated.
Type :help for more information.

scala> root@hadoop-master:~#
root@hadoop-master:~# history > TP3
root@hadoop-master:~# ^C
root@hadoop-master:~#
root@hadoop-master:~# exit
exit
PS C:\Users\elbaidoury> history > TP3
PS C:\Users\elbaidoury> ls


    Directory: C:\Users\elbaidoury


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          6/3/2021   7:21 PM                .cache
d-----         12/6/2021  12:32 PM                .conda
d-----          6/5/2021  10:24 PM                .config
d-----         10/1/2021  12:06 PM                .continuum
d-----        12/22/2021   9:19 PM                .docker
d-----          6/3/2021  10:34 PM                .eclipse
d-----         11/3/2021   9:00 AM                .gradle
d-----        12/19/2021   3:37 PM                .ipynb_checkpoints
d-----         7/19/2021   1:14 PM                .ipython
d-----         8/21/2021  10:32 AM                .jupyter
d-----          6/3/2021  10:59 PM                .lemminx
d-----          6/3/2021  10:57 PM                .m2
d-----        10/25/2021  10:13 AM                .matplotlib
d-----         6/18/2021  11:00 PM                .Neo4jDesktop
d-----        12/12/2021   2:05 PM                .p2
d-----          7/2/2021   8:47 PM                .spss
d-----         12/5/2021  12:39 PM                .spyder-py3
d-----         8/12/2021  12:19 PM                .ssh
d-----          6/3/2021   1:17 PM                .vscode
d-r---          6/4/2021   8:37 PM                3D Objects
d-----         7/19/2021   1:12 PM                anaconda3
d-----         11/3/2021  10:24 AM                AndroidStudioProjects
d-----          6/4/2021   2:26 PM                Cisco Packet Tracer 8.0
d-r---          6/4/2021   8:37 PM                Contacts
d-r---        12/22/2021   9:05 PM                Desktop
d-r---        12/15/2021   9:07 AM                Documents
d-r---        12/22/2021   9:23 PM                Downloads
d-----          6/3/2021  10:26 PM                eclipse
d-----          6/3/2021  10:57 PM                eclipse-workspace
d-r---          6/4/2021   8:37 PM                Favorites
d-----         6/16/2021  12:00 PM                Game
d-----         6/27/2021  10:48 PM                Game_TEST
d-----         12/4/2021   1:10 PM                Jedi
d-r---          6/4/2021   8:37 PM                Links
d-r---        10/30/2021  11:32 AM                Music
d-r---          8/9/2021  12:40 AM                OneDrive
d-r---        12/20/2021   7:33 PM                Pictures
d-----         10/1/2021   4:47 PM                pipwin
d-r---          6/4/2021   8:37 PM                Saved Games
d-r---          6/4/2021   8:37 PM                Searches
d-----         6/27/2021   7:14 PM                source
d-r---        11/18/2021   9:51 PM                Videos
-a----        12/22/2021  11:45 PM          16099 .bash_history
-a----        10/25/2021  11:22 AM             42 .condarc
-a----          6/4/2021  10:43 AM            300 .dbshell
-a----          6/5/2021  11:03 PM             65 .gitconfig
-a----         8/17/2021  11:10 PM             25 .minttyrc
-a----          6/3/2021   2:06 PM              0 .mongorc.js
-a----        11/10/2021   2:46 PM            178 .packettracer
-a----         10/1/2021   4:46 PM        1383811 .pipwin
-a----         12/4/2021  12:26 PM           7929 .viminfo
-a----         11/3/2021  11:30 AM              0 idea.updater.files16651106191843
                                                  376836marker
-a----        12/23/2021  10:39 AM           3038 TP3
-a----         8/21/2021  10:38 AM            891 Untitled.ipynb
-a----         10/6/2021   9:45 PM           1685 Untitled1.ipynb
-a----        12/19/2021   3:39 PM           1306 Untitled2.ipynb


PS C:\Users\elbaidoury> ls


    Directory: C:\Users\elbaidoury


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----          6/3/2021   7:21 PM                .cache
d-----         12/6/2021  12:32 PM                .conda
d-----          6/5/2021  10:24 PM                .config
d-----         10/1/2021  12:06 PM                .continuum
d-----        12/22/2021   9:19 PM                .docker
d-----          6/3/2021  10:34 PM                .eclipse
d-----         11/3/2021   9:00 AM                .gradle
d-----        12/19/2021   3:37 PM                .ipynb_checkpoints
d-----         7/19/2021   1:14 PM                .ipython
d-----         8/21/2021  10:32 AM                .jupyter
d-----          6/3/2021  10:59 PM                .lemminx
d-----          6/3/2021  10:57 PM                .m2
d-----        10/25/2021  10:13 AM                .matplotlib
d-----         6/18/2021  11:00 PM                .Neo4jDesktop
d-----        12/12/2021   2:05 PM                .p2
d-----          7/2/2021   8:47 PM                .spss
d-----         12/5/2021  12:39 PM                .spyder-py3
d-----         8/12/2021  12:19 PM                .ssh
d-----          6/3/2021   1:17 PM                .vscode
d-r---          6/4/2021   8:37 PM                3D Objects
d-----         7/19/2021   1:12 PM                anaconda3
d-----         11/3/2021  10:24 AM                AndroidStudioProjects
d-----          6/4/2021   2:26 PM                Cisco Packet Tracer 8.0
d-r---          6/4/2021   8:37 PM                Contacts
d-r---        12/22/2021   9:05 PM                Desktop
d-r---        12/15/2021   9:07 AM                Documents
d-r---        12/22/2021   9:23 PM                Downloads
d-----          6/3/2021  10:26 PM                eclipse
d-----          6/3/2021  10:57 PM                eclipse-workspace
d-r---          6/4/2021   8:37 PM                Favorites
d-----         6/16/2021  12:00 PM                Game
d-----         6/27/2021  10:48 PM                Game_TEST
d-----         12/4/2021   1:10 PM                Jedi
d-r---          6/4/2021   8:37 PM                Links
d-r---        10/30/2021  11:32 AM                Music
d-r---          8/9/2021  12:40 AM                OneDrive
d-r---        12/20/2021   7:33 PM                Pictures
d-----         10/1/2021   4:47 PM                pipwin
d-r---          6/4/2021   8:37 PM                Saved Games
d-r---          6/4/2021   8:37 PM                Searches
d-----         6/27/2021   7:14 PM                source
d-r---        11/18/2021   9:51 PM                Videos
-a----        12/22/2021  11:45 PM          16099 .bash_history
-a----        10/25/2021  11:22 AM             42 .condarc
-a----          6/4/2021  10:43 AM            300 .dbshell
-a----          6/5/2021  11:03 PM             65 .gitconfig
-a----         8/17/2021  11:10 PM             25 .minttyrc
-a----          6/3/2021   2:06 PM              0 .mongorc.js
-a----        11/10/2021   2:46 PM            178 .packettracer
-a----         10/1/2021   4:46 PM        1383811 .pipwin
-a----         12/4/2021  12:26 PM           7929 .viminfo
-a----         11/3/2021  11:30 AM              0 idea.updater.files16651106191843376836marker
-a----        12/23/2021  10:39 AM           3038 TP3
-a----         8/21/2021  10:38 AM            891 Untitled.ipynb
-a----         10/6/2021   9:45 PM           1685 Untitled1.ipynb
-a----        12/19/2021   3:39 PM           1306 Untitled2.ipynb


PS C:\Users\elbaidoury>