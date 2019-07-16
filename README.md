# ssp是一个远程服务器管理shell脚本

## 依赖

* **sshpass**

## 使用

* 创建 *~/.ssh_pass* 文件内容格式如下

> ```
> [name] [host] [passw] [port]
> ...
> ```
> 例如 ``` myEcs 112.124.121.183 abc123 22 ```

* 将脚本 *ssp.sh* 重命名为 *ssp* 然后放入 */usr/bin* 或者 */usr/local/bin*

* 接下来你就可以执行 *ssp* 命令了 

> ```
> $ ssp
> ssp options:
> usage: ssp
> [-h look host list.]
> [xxx quick link host.]
> ```
> 查看主机列表并选择一个远程登录
>
> ```
> $ ssp -h
> Please Enter Number Select:
> 1) myEcs[112.124.121.183]
> #?_
> ```
> 或者直接通过 name 快速登录
> ``` 
> $ ssp myEcs 
> Last login: Tue Jul 16 10:47:25 2019 from 112.124.121.183
> 
> Welcome to Alibaba Cloud Elastic Compute Service !
>
> [root@iZwz92d4dn4mvydZ ~]# _
> ```
