# tcpforward
The ever most simple TCP forwarder in GoLang - This thing ate all my forwarded packets!

Need to redirect traffic from one place to another? Testing needs? Something temporary? Or permanent? Dont wanna mess around SSH TCP forwarding setting? No problemo my friendo! By the power of GoLang we can redirect traffic received on localhost:port to remotehost:post by using directly socket attribution, not fancy nor complicated, yet, very functional and useful.

I actually wrote this to build a Docker image from it, code wouldnt change but 'usage' surely will when it's dockerised. Dockerfile should (if not already) be included in this repo.

You can compile it as any Go package, no rocket science or additional string attached. 

Default GoLang build:

    go build -o tcpforward tcpforward.go
    
Usage:
    ./tcpforward [-s] -l local_address:port -r remote_address:port

        -l host:port    to listen on (required).
        -r host:port    to forward to (required).
        -s              run silently, do not stdout anything.
        
To build for Docker:
    
    GOOS=linux go build -o tcpforward tcpforward.go

Docker usage: It's kinda messed by now, but I plan to make it less garbage. Seeking a way to expose ports dynamically without making unsecure (and promiscuous) use of host network

    docker run --rm -it -p [local_port_to_expose]:[local_port_to_expose] --name tcpforward tcpforward -l 0.0.0.0:local_port_to_expose -r [remote_addr]:[remote_port]
    
So, for example, if you want to access 192.168.0.1:80 thru localhost:9999:

    docker run --rm -it -p 9999:9999 --name tcpforward tcpforward -l 0.0.0.0:9999 -r 192.168.0.1:80
