# mystic-lrzsz
Add lrzsz transfers to Mystic BBS

Requires lrzsz to be installed. For debian do 
- `sudo apt install lrzsz`


Files to put into the mystic root dir;

- sz-wrapper.sh
- rz-wrapper.sh

i.e. /mystic or /home/bbs/mystic

Then go into "Editors -> Protocol Editor" and add a new protocol like this;

```
╒═════════════════ Protocol Editor: LRZSZ - ZMODEM ══════════════════╕
│                                                                    │
│        Active │ Yes                                                │
│            OS │ All                                                │
│         Batch │ Yes                                                │
│       Hot Key │ 0                                                  │
│   Description │ LRZSZ - ZMODEM                                     │
│  Send Command │ /mystic/sz-wrapper.sh %3                           │
│  Recv Command │ /mystic/rz-wrapper.sh                              │
│                                                                    │
╘════════════════════════════════════════════════════════════════════╛
```
