traffic_control:
  cmd.run:
    - name: tc qdisc add dev eth1 root netem delay 10ms