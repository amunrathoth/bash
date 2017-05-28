vrs=$(cat  README  |grep "This Version changes:" | tr '"' "   " |awk '{print $4}')
i=$(virsh list --all  --state-running | awk '{ print $2 }' | tail -n+3 | tr "\n" " ") ; for i in $i ;  { echo -ne $i "_____" ; virsh dumpxml $i |grep -e "source dev"|awk {'print $2'} ; echo -ne $i "_mac__" ; virsh dumpxml $i |grep -e "mac address"|awk {'print $2'};  virsh dumpxml $i |grep -e "type arch="|awk {'print $6'}; echo ; }

nohup ex -c '$a|command[cpu]=/home/nagios/libexec/cpu -w 95 -c 99' -cx tobechanged.cfg



as=$(ifconfig eth0 |grep -e "TX packets"|awk '{print $5}');xc=$(echo $as/1024/1024 |bc);echo -n $xc Mb; echo

sed 's/"//g'
parallel-ssh -A -H localhost -i 'service ssh restart'
parallel-ssh -A -H localhost -I 'cat >> ~.ssh/authorized_keys'


ps -eo rss,vsz,pid,cmd | awk '{print $2-$1,$0}' | sort -nr | head
netstat -tn 2>/dev/null | grep ':80 ' | awk '{print $5}' |sed -e 's/::ffff://' | cut -f1 -d: | sort | uniq -c | sort -rn | head
echo "DISK:";df -Pl | grep -v "Filesystem" | awk '{print $5,$6}' ; echo "MEM:" ; free -m | awk '{ print $1,$2,$3,$4 }'; echo "CPU:"; top -b -d1 -n1 | grep Cpu | awk '{print $2,$3,$4,$5,$6,$7,$8,$9}';echo "LOAD:"; cat /proc/loadavg

lsmod | sed -e '1d' -e 's/\(\([^ ]*\) \)\{1\}.*/\2/' | xargs modinfo | sed -e '/^dep/s/$/\n/g' -e '/^file/b' -e '/^desc/b' -e '/^dep/b' -e d


du -a / | sort -n -r | head -n 5

ps -eo pmem,comm | grep java | awk '{sum+=$1} END {print sum " % of RAM"}'

tree -a -L 1 --inodes /

watch -n1 iptables -vnL

sudo watch -n1 iptables -vnL

view alll lines without comments
grep -v "^#" file.txt | more

cat file.txt|perl -ne '$_=~s/\s+/\n/g; print $_;'
replace spaces with newlines


find . -type f -mtime +7 -exec ls -l {} \;
files older than 7 days

pstree -Gap

mem used by all procs
ps aux | awk '{sum+=$6} END {print sum/1024}'

ls -l /proc/*/fd*/* |more |grep tmp

for i in G M K; do du -ah | grep [0-9]$i | sort -nr -k 1; done | head -n 11



chage -I -1 -m 0 -M 999999 -E -1
openfiles
lsof -a -d 1-99 -Fn / | grep ^n | cut -b2- | sort | uniq -c | sort -n
( crontab -l 2>/dev/null | grep -Fv "/var/log/sessions" ; printf -- "6 23 * * * find /var/log/sessions -mtime +${SESSION_MAXAGE} -exec rm {} +\n" ) | crontab

echo "DISK:";df -Pl | grep -v "Filesystem" | awk '{print $5,$6}' ; echo "MEM:" ; free -m | awk '{ print $1,$2,$3,$4 }'; echo "CPU:"; top -b -d1 -n1 | grep Cpu | awk '{print $2,$3,$4,$5,$6,$7,$8,$9}';echo "LOAD:"; cat /proc/loadavg

lsof -nP | awk '/deleted/'

lsmod | sed -e '1d' -e 's/\(\([^ ]*\) \)\{1\}.*/\2/' | xargs modinfo | sed -e '/^dep/s/$/\n/g' -e '/^file/b' -e '/^desc/b' -e '/^dep/b' -e d

lsof -p 28656 | grep -E "\.log$" | awk '{print $NF}'

ps -eo user,pcpu,pmem | tail -n +2 | awk '{num[$1]++; cpu[$1] += $2; mem[$1] += $3} END{printf("NPROC\tUSER\tCPU\tMEM\n"); for (user in cpu) printf("%d\t%s\t%.2f\t%.2f\n",num[user], user, cpu[user], mem[user]) }' |sort -h

watch -n0.1 vmstat -sSM


