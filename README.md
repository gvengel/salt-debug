Salt Debug Setup
================

Install [Vagrant](https://www.vagrantup.com/downloads) 
and virtualization provider such as 
[Virtualbox](https://www.virtualbox.org/wiki/Downloads).

Clone this project, and `cd` to the project directory.

Bring up the vagrant stack, and shell to the salt master.
```bash
vagrant up
vagrant ssh
```

As root, apply the various test states.
```bash
sudo -s
salt minion state.apply content
salt minion state.apply http
salt minion state.apply fileserver
```

You might want to run each state a couple of times, 
since they will speed up once the cache is warm.

Notice the `fileserver` state takes considerably longer. 
With a warm cache it takes ~10s, where `http` takes ~6s, and `content` only takes ~1s.

To observe how latency compounds the problem:

```bash
# This adds 10ms of latency to the network
salt minion state.apply latency

# Run the test states again
salt minion state.apply content
salt minion state.apply http
salt minion state.apply fileserver
```

Now `fileserver` takes ~55s, where `http` takes ~33s, and `content` still only takes ~1s.

To remove the latency, you can reboot the minion.
```bash
salt minion system.reboot
```