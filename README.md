# Command Line Heroes

Unofficial fork of the [Command Line Heroes](https://github.com/CommandLineHeroes/clh-bash) game repository.
This game will be used during Sorint.lab Download Festival 2021 for the "Fun" part.

It's a speed game where you make point every time you type a commands or keywords of the following accepted language:
- bash / shell
- python
- javascript
- html
- SQL
- ansible module
- microsoft / powershell
- cisco

## Installing

1. Install docker and docker compose on the desktop / laptop you want to play

2. pull this repository to /root directory

  ```bash
  cd /root/
  git clone https://github.com/mossicrue/clh-sorint.git
  ```

3. create the /root/leaderboard directory

  ```bash
  mkdir /root/leaderboard
  ```

4. go to the repository directory

  ```bash
  cd /root/clh-sorint
  ```

5. start the game

  ```
  docker compose up -d
  ```

# OLD INSTALLATION MODE

NOTE: To add additional languages see the end of this readme

## Super Fast Installation on Killercoda

1. Open the Openshift 4.7 playground [here on killercoda](https://killercoda.com/playgrounds/scenario/kubernetes)

2. Click on the orange "Start Scenario" button on the bottom of the page

3. Wait for playground to be ready

4. Run the following command
```bash
curl -s https://raw.githubusercontent.com/mossicrue/clh-sorint/refs/heads/master/k8s-install.sh | bash
```

5. Wait for the game to install and open the link prompted, use Chrome for the best experience

6. Enjoy your 60 minutes session of Command Line Heroes!

## Get started

The Game is been containerized for a simply deploy in a docker or kubernetes environment.
The image is based on the official node:16.5.0 image.

### Create the image

To create a new image of clh-game follow these steps:

1. Update the clh-game directory content

2. Create the game archive by launching the following command

```bash
tar -cvzf clh-game.tar.gz --directory clh-game
```

3. Build the image

```bash
docker build -t clh-game:<tag> .
```

## Run the game

It is possible to run the game locally on Docker or in a orchestrated environment like Openshift.

### Docker Environemnt

To run the game locally in a container engine like docker

```bash
docker pull mossicrue/clh-game:stable
docker run --detach --restart always --port 3000:3000 --port 3001:3001 --name clh-game mossicrue/clh-game:stable
```

The game will be accessible on http://localhost:3000 in your preferred browser

### Containerized Environment

To run the game in an orchestrated environment like kubernetes or openshift

```bash
kubectl apply -f clh-install.yaml
```

The all-in-one manifest will create:
- namespace
- deployment
- service
- loadbalancer
- route

## Add additional languages

Is it possibile to add all additional languages you want, to do this just follow the languages [readme](clh-game/assets/cmds/README.md)
