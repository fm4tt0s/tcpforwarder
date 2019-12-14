# tcpforward
The ever most simple TCP forwarder in GoLang - This thing ate all my forwarded packets!

Need to redirect traffic from one place to another? Testing needs? Something temporary? Or permanent? Dont wanna mess around SSH TCP forwarding setting? No problemo my friendo! By the power of GoLang we can redirect traffic received on localhost:port to remotehost:post by using directly socket attribution, not fancy nor complicated, yet, very functional and useful.

I actually wrote this to build a Docker image from it, code wouldnt change but 'usage' surely will when it's dockerised. Dockerfile should (if not already) be included in this repo.

You can compile it as any Go package, no rocket science or additional string attached. 

Usage:
    ./tcpforward [-s] -l local_address:port -r remote_address:port

        -l host:port    to listen on (required).
        -r host:port    to forward to (required).
        -s              run silently, do not stdout anything.
