#!/bin/bash
# 写自己队的ip
ipA="172.22.60.230"
ipB="172.22.60.231"
ipC="172.22.60.232"
while [ "1" = "1" ]
do
    hackip=$(netstat -an | grep "ESTA" | awk '{print $5}' | cut -d ":" -f1)
    if [[ "$ipA" =~ "$hackip" && "$ipB" =~ "$hackip" && "$ipC" =~ "$hackip" ]]; then
        echo "$(LC_ALL=en_US.utf8 date '+%Y-%m-%d %H:%M:%S') 安全!!!" >> iplog.txt
    else
        # gnome-terminal -t "Warning! Warning!" -x bash -c "echo 有不明IP闯入！----'$hackip';exec bash;"
        echo "$(LC_ALL=en_US.utf8 date '+%Y-%m-%d %H:%M:%S') $hackip" >> hackiplog.txt
    fi
    sleep 30
done
# iptables -A INPUT -s $hackip -j REJECT   # 屏蔽某个ip
# iptables -L     # 查看防火墙策略
# iptables -F    # 关闭防火墙策略
