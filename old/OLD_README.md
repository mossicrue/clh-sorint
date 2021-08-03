## Leaderboard selection

Bash supports multiple options for leaderboard storage.  The default is in-browser `localStorage`.  A networked leaderboard is also supported, through sending leaderboard entries to a Parse server.

### Networked leaderboards with Parse

If you want a networked leaderboard, you must have a Parse instance up and running. Then, open `src/config.js` and change `PARSE_URL` to point to the URL of your parse server.

Finally, when you launch Bash, add `&storage=parse` to the end.

### Selecting a leaderboard namespace

Both `localStorage` and Parse leaderboard support namespacing.  In other words, you can give the leaderboard a name.  This is especially useful if you need to maintain multiple leaderboards, for tournament rounds, timed events at conferences, etc.  Switching between leaderboards is as easy as changing the namespace.

Then, when you launch Bash, add `&name=NAMESPACE` to the end of Bash's URL.  Note that you can change the word `NAMESPACE` to be anything you want.