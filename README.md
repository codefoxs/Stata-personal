# Stata command by CodeFox

## 1 Method

Verify the name of the command you want to download, and then enter the following code to install or update the command

### GitHub

```stata
* Install
net install [command], from("https://raw.githubusercontent.com/codefoxs/Stata-personal/main/[command]/") replace

* Version
which [command]
```

### Gitee

```Stata
* Install
net install [command], from("https://gitee.com/code-fox/Stata-personal/raw/main/[command]/") replace

* Version
which command
```

## 2 Command list

| Command            | Function                                                     | Version |
| ------------------ | ------------------------------------------------------------ | ------- |
| [datedv](./datedv) | Quickly convert date strings to year, month, day and so on.  | 0.1.1   |
| [cnprov](./cnprov) | Stata commands for Chinese province strings conversion       | 0.1.1   |
| [lewbel](./lewbel) | Heteroskedasticity-based instrumental variable regression (Lewbel, 2012) | 0.1.4   |
| [csmar](./csmar)   | Stata commands for load CSMAR xlsx/zip/dta file              | 0.1.4   |

## 3 Comments

> [!NOTE]
>
> If you have any questions, please leave a message in issue.



