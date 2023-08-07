# docker-cmd-test
CMDの書き方、シェルの種類によって挙動が変わるので、いろいろ試してみる

## 比較対象
|         | CMD Json Format      | CMD Shell Format | CMD Json Format with Shell          | CMD Json Format with shell exec          |  |
|---------|----------------------|------------------|-------------------------------------|------------------------------------------|--|
| command | ["sleep", "infinity"] | "sleep infinity" | ["/bin/sh", "-c", "sleep infinity"] | ["/bin/sh", "-c", "exec sleep infinity"] |  |

## 結果
### ps axjf
#### CMD Json Format
```bash
$ docker compose exec cmd-json-format ps axjf | grep -v 'ps axjf'
 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    0     1     1     1 ?           -1 Ss       0   0:00 sleep infinity
```

#### CMD Shell Format
```bash
$ docker compose exec cmd-shell-format ps axjf | grep -v 'ps axjf'
 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    0     1     1     1 ?           -1 Ss       0   0:00 sleep infinity
```

#### CMD Json Format with shell
```bash
$ docker compose exec cmd-json-format-with-sh ps axjf | grep -v 'ps axjf'
 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    0     1     1     1 ?           -1 Ss       0   0:00 /bin/sh -c sleep infinity
    1     6     1     1 ?           -1 S        0   0:00 sleep infinity
```

#### CMD Json Format with shell exec
```bash
$ docker compose exec cmd-json-format-with-sh-exec ps axjf | grep -v 'ps axjf'
 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    0     1     1     1 ?           -1 Ss       0   0:00 sleep infinity
```
