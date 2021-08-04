# Available Languages and how to add a new language

In this version of the game there are 2 type of languages:

- Original: already present in the original RedHat game
  - bash
  - html
  - javascript
  - python

- Customized: added by me searching online and asking colleagues
  - sql
  - ansible
  - microsoft / powershell
  - cisco

## Original Languages

For the original languages I prefer to left the original database intact.
From the origianl README:
- bash / shell uses Fedora and Ubuntu binaries found path.
- javascript and html are taken by some w3 and w3school guides.
- python seems to be added from the same type of javascript

## SQL

The different source for SQL commands and keywords I used are:
- w3 and w3school pages
- PostgreSQL documentation appendix by looking for standard keyworkd.

See files `from-sql-base.txt` and `from-postgres-doc.txt` for all the command I added

## Powershell

The different source for SQL commands and keywords I used are:
- w3 and w3school pages
- PostgreSQL documentation appendix by looking for standard keyworkd.

See files from-sql-base.txt and from-postgres-doc.txt for all the command I added

## Ansible

## Cisco

## Add a new language

Note: all commands to be run from this directory, `assets/cmds/`.

1. Create the <language>.js file that will contains the new languages command and keyword.

2. Copy this javascript snippet and paste in the file previously created.

```js
export default {
    name: "NEW_LANGUAGE",
    commonCmds: [
      "command2",
      "command4"
    ],
    cmds: [
      "command1",
      "command2",
      "command3",
      "command4"
    ]
};
```

3. Replace the value of `name:` key with the new language name

4. Replace the sample strings with all the commands, keywords etc... as an the `cmds:` dictionary

5. Replace the sample strings with all the common commands, keywords etc... as an the `commonCmds:` dictionary

6. Adapt the code in the right section, to do so find the "Add other languages section" comments in the following files:

- src/app.js
- src/cmnds.js
- src/main.js