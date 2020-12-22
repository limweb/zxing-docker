## Quick Start

Pull this image to local:

```
docker pull dwimberger/alpine-qr
```


Generate a QR code:

```
 docker run -t -i --rm -v `pwd`:/qr dwimberger/alpine-qr qrencode --output helloworld.png `D2D75299-650B-4B34-B75C-AE59C9EACAF1`
```

Output:

![D2D75299-650B-4B34-B75C-AE59C9EACAF1](https://raw.githubusercontent.com/dwimberger/alpine-qr/master/helloworld.png)

Parse a QR code:

```
docker run -t -i --rm -v `pwd`:/qr dwimberger/alpine-qr qrdecode helloworld.png
```

Output：

```
D2D75299-650B-4B34-B75C-AE59C9EACAF1
```

## How to Build this image ?

```
git clone https://github.com/dwimberger/alpine-qr.git
cd alpine-qr
docker build -t dwimberger/alpine-qr .
```


#!/bin/sh

#Run like this
set -e
if [ ! -f IMG.jpg ] ; then echo "The image file to convert doesn't exist!" && exit 1 ; fi
docker build -t zxing .
docker run --net=none -v $PWD/IMG.jpg:/IMG.jpg --rm zxing --try_harder file:///IMG.jpg