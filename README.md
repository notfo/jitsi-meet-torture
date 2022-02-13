# Loadtest for your Jitsi-Meet Server
## General

To test your Jitsi-Meet Performance there are many differnt ways to perform a perfomance test.

The best way is to test choosing a browser based test, but it´s not that easy to find some collegues or friend to test you jitsi-meet server in a propper way.

So we build op a new testenvironment which also works with jwt authentication. This is not working in a lot of other jitsi-torture tests.
You can als add bots to your conference which you are already in.

So first we need to install docker and docker-composer on our server. We recommend to use a linux server, not windows, because the torture test will take a lot of performance.
We take some steps from the original post https://meetrix.io/blog/webrtc/jitsi/jitsi-meet-load-testing.html



![02-10-load-testing-jitsi-meet-01.png](https://h2-invent.com/storage/app/uploads/public/620/8e5/6d4/6208e56d4fe37847171013.png)


## Clone Repository
We create a fork with some changes to trigger specific urls including JWT. You can use clone this repository to perform the test. __https://github.com/holema/jitsi-meet-torture__

In the first step, you have to clone the repository on our local host and jump into the directory
```
mkdir /tmp/jitsi-torture && cd /tmp/jitsi-torture
git clone https://github.com/holema/jitsi-meet-torture.git
cd jitsi-meet-torture
```
This can take some while bcause we deliver all the sounds and videos for the test.

## Requirements
When cloning the repository is finished we have to build the special docker image we use for the
test.
You need to have __docker__ and __docker-compose__ installed on the host. This depends on you OS and is not descriped here.

## Docker build
After installing Docker Compose on your system run docker build to build the custom image
```
docker-compose build
```
This command  will build a new docker image which is used to setup the test with docker.

## Docker compose and scale the number of participants

For setting up the test infrastructure, it important to understand, that every docker container creates one participant which will later join the conference. So you have to create as many docker containers as you want. Here we work with two docker container
```
docker-compose up -d --scale node=<AMOUNT OF NODES>
```
This will now download the rest of the images wich are shown in the image above.

_After this step, the infrastructure is ready and you can start the tests inside the containers._

## Show all containers

When your setup is created correctly you can start with testing and torture your jitsi-meet server. To perform a test you first check if your infrastructure is up.

To see all your running docker container enter:

```
docker ps
```

![Bild_2022-02-13_121541.png](https://h2-invent.com/storage/app/uploads/public/620/8e8/5da/6208e85dad494729919184.png)


The output should be something like this with all your containers listed with a number (postfix).

## Run the test
When all your conatiners show the Status __UP__ you can start.

Here you just type the following command:
```
docker exec jitsi-meet-torture_torture_1  ./scripts/malleus.sh --conferences=1 --participants=<AMOUNT OF PARTICIPANTS> --senders=<AMOUNT OF VIDEOS STREAMS> --audio-senders=<AMOUNT OF AUDIO STREAMS> --duration=<DURATION IN SEC> --room-name-prefix= --hub-url=http://hub:4444/wd/hub --instance-url=<ENTER HERE YOUR JITSI CONFERENCE URL ALSO WITH JWT IF YOU USE ONE>
```
* --conferences: here the number of conferences. The torture agounst a specific room only works when this is set to 1
* --participants: amount of participants which should joint the room. this must be smaller or equal the nodes
* --senders: amount of how many participants send a video
* --audio-senders: amount of participants sending a audio
* -- duration: how long sending the torture in sec (600 = 10min)
* --hub-url: leav as it is
* --instance-url: Here you should enter your specific room to test (ex. https://meetexample.com/myroomtotest). If you use a jwt authentication set the url with your JWT token (ex. https://meetexample.com/myroomtotest?jwt=ey........)

This will now start the Torture test agains the configured URL.


![Bild_2022-02-13_122115.png](https://h2-invent.com/storage/app/uploads/public/620/8e9/ad7/6208e9ad7cc05622498214.png)

Here you can see a room which is protected with a JWT token and the torture video streams.

## Shutdown testinfrastucture
To shutdown the complete infrastructure enter the following command:

```
docker-compose down
```


## Hint
You need a lot of CPU, Memory, and Network Ressources to performe the tests. Otherwise, your test infrastructure will collape and will not test the performance of your Jitsi Meet Server.

# Support
__If you have questions or need support with testing the performance of your Jitsi Meet Server, you can send us an Email.__