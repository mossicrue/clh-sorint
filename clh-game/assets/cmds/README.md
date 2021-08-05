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

The sources for SQL commands and keywords used are:
- w3 and w3school pages like [this](https://www.w3schools.com/sql/sql_ref_keywords.asp)
- PostgreSQL documentation [appendix](https://www.postgresql.org/docs/current/sql-keywords-appendix.html) by looking for standard keyworkd.

See files `from-sql-base.txt` and `from-postgres-doc.txt` for all the available command.

## Powershell

The source for Powershell commands and keywords used are from [ss64.com](https://ss64.com/ps/)

See files `from-ss64-ps-ad.txt` and `from-ss64-ps-all.txt` for all the available command.

## Ansible

The sources for Ansible modules and keywords used are:
- "Ansible.Builtin" [page](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
- Ansible "All Modules" [page](https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html)

See files `from-ansible-common.txt` and `from-ansible-all.txt` for all the available command.

## Cisco

The commands and keyword for Cisco were provided from a colleague that works as networking sysadmin

See files `from-ccna-common.txt` and `from-ccna.txt` for all the available command.

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

- src/cmnds.js
- src/app.js
- src/main.js