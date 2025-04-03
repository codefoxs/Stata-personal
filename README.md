# Stata command by CodeFox

## 1 Method

Change the macro `command` to the name of the command you need to download, and run all the lines simultaneously.

### GitHub

```stata
* Install
local command = "Command name"
net install `command', from("https://raw.githubusercontent.com/codefoxs/Stata-personal/main/`command'/") replace

* Version
which `command'
```

### Gitee

```Stata
* Install
local command = "Command name"
net install `command', from("https://gitee.com/code-fox/Stata-personal/raw/main/`command'/") replace

* Version
which `command'
```

## 2 Command list

| Command            | Function                                                     | Version |
| ------------------ | ------------------------------------------------------------ | ------- |
| [datedv](./datedv) | Quickly convert date strings to year, month, day and so on.  | 0.1.1   |
| [cnprov](./cnprov) | Stata commands for Chinese province strings conversion       | 0.1.2   |
| [lewbel](./lewbel) | Heteroskedasticity-based instrumental variable regression (Lewbel, 2012) | 0.1.4   |
| [csmar](./csmar)   | Stata commands for load CSMAR xlsx and zip file              | 0.1.4   |

## 3 Comments

> [!NOTE]
>
> If you have any questions, please leave a message in issue.



