


echo "Check query time using google DNS"

dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
sleep 1

# Saida de exemplo
# root@dnsmasq:~# dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 86 msec
# root@dnsmasq:~# dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 77 msec
# root@dnsmasq:~# dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 73 msec
# root@dnsmasq:~# dig  @8.8.8.8 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 77 msec

echo "Check query time using ISP DNS"


dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
sleep 1

# Saida de exemplo
# root@dnsmasq:~# dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 7 msec
# root@dnsmasq:~# dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 5 msec
# root@dnsmasq:~# dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 7 msec
# root@dnsmasq:~# dig  @192.168.15.1 -4 -q www.google.com | grep 'Query time'
# ;; Query time: 4 msec


echo "Check query time without defining DNS"

dig www.google.com | grep 'Query time'
sleep 1

dig www.google.com | grep 'Query time'
sleep 1

dig www.google.com | grep 'Query time'
sleep 1

dig www.google.com | grep 'Query time'
sleep 1

# Saida de exemplo
# root@dnsmasq:~# dig www.google.com | grep 'Query time'
# ;; Query time: 38 msec
# root@dnsmasq:~# dig www.google.com | grep 'Query time'
# ;; Query time: 5 msec
# root@dnsmasq:~# dig www.google.com | grep 'Query time'
# ;; Query time: 4 msec
# root@dnsmasq:~# dig www.google.com | grep 'Query time'
# ;; Query time: 4 msec

echo "Check query time with dnsmasq docker container"

dig  @localhost -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @localhost -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @localhost -4 -q www.google.com | grep 'Query time'
sleep 1

dig  @localhost -4 -q www.google.com | grep 'Query time'
sleep 1

# Saida de exemplo
# root@dnsmasq:~# dig  @localhost -4 -q www.google.com | grep 'Query time'
# ;; Query time: 0 msec
# root@dnsmasq:~# dig  @localhost -4 -q www.google.com | grep 'Query time'
# ;; Query time: 0 msec
# root@dnsmasq:~# dig  @localhost -4 -q www.google.com | grep 'Query time'
# ;; Query time: 0 msec
# root@dnsmasq:~# dig  @localhost -4 -q www.google.com | grep 'Query time'
# ;; Query time: 0 msec