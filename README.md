# Command Line Heroes

Unofficial fork of the [Command Line Heroes](https://github.com/CommandLineHeroes/clh-bash) game repository.
This game will be used during Sorint.lab Download Festival 2021 for the "Fun" part.

## Docker Image

The Game is been containerized for a simply deploy in a docker or kubernetes environment.
The image is based on the official node:16.5.0 image.

To run the game locally in a container engine like docker

    docker pull docker.io/mossicrue/clh-sorint:stable
    docker run -d mossicrue/clh-sorint:stable -p 3000:3000 -p 3001:3001

To run the game in an orchestrated environment like kubernetes or openshift

    kubectl apply -f clh-install.yaml

The all-in-one manifest will create:
- namespace
- deployment
- service
- loadbalancer
- route

<!--
## Leaderboard selection

Bash supports multiple options for leaderboard storage.  The default is in-browser `localStorage`.  A networked leaderboard is also supported, through sending leaderboard entries to a Parse server.

### Networked leaderboards with Parse

If you want a networked leaderboard, you must have a Parse instance up and running. Then, open `src/config.js` and change `PARSE_URL` to point to the URL of your parse server.

Finally, when you launch Bash, add `&storage=parse` to the end.

### Selecting a leaderboard namespace

Both `localStorage` and Parse leaderboard support namespacing.  In other words, you can give the leaderboard a name.  This is especially useful if you need to maintain multiple leaderboards, for tournament rounds, timed events at conferences, etc.  Switching between leaderboards is as easy as changing the namespace.

Then, when you launch Bash, add `&name=NAMESPACE` to the end of Bash's URL.  Note that you can change the word `NAMESPACE` to be anything you want.
-->