FROM openjdk:8u111-jre-alpine
RUN mkdir /zxing
RUN mkdir /qr
WORKDIR /zxing
COPY core-3.3.3.jar        /zxing/core-3.3.3.jar
COPY javase-3.3.3.jar      /zxing/javase-3.3.3.jar
COPY jcommander-1.72.jar   /zxing/jcommander-1.72.jar

COPY qrdecode /usr/bin/qrdecode
COPY qrencode /usr/bin/qrencode

RUN chmod a+x /usr/bin/qrdecode 
RUN chmod a+x /usr/bin/qrencode 

WORKDIR /qr
COPY images  /qr/images

# ENTRYPOINT ["java","-cp", "core-3.3.3.jar:javase-3.3.3.jar:jcommander-1.72.jar", "com.google.zxing.client.j2se.CommandLineRunner"]