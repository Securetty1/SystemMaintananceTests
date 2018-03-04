#!/bin/bash

echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.eth0.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.lo.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.log_martians=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.log_martians=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syn_retries=2" >> /etc/sysctl.conf
echo "net.ipv4.tcp_synack_retries=2" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog=2048" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rfc1337=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_timestamps=0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout=15" >> /etc/sysctl.conf
echo "net.ipv4.tcp_keepalive_time=1800" >> /etc/sysctl.conf
echo "net.ipv4.tcp_orphan_retries=2" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.secure_redirects=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.rp_filter=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts=1" >> /etc/sysctl.conf
echo "net.ipv4.icmp_ignore_bogus_error_responses=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=htcp" >> /etc/sysctl.conf
echo "kernel.randomize_va_space=2" >> /etc/sysctl.conf
echo "fs.suid_dumpable=0" >> /etc/sysctl.conf
echo "fs.protected_symlinks=1" >> /etc/sysctl.conf
echo "fs.protected_hardlinks=1" >> /etc/sysctl.conf

echo "The system configuration file has been secured. Review in order to ensure that they did not include any surprises earlier on within the file contradicting the security enhanced edition."
