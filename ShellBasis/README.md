###Reference：[ http://c.biancheng.net/cpp/linux/](http://c.biancheng.net/cpp/linux/)


**Shell有两种执行命令的方式：**

- 交互式（Interactive）：解释执行用户的命令，用户输入一条命令，Shell就解释执行一条。
- 批处理（Batch）：用户事先写一个Shell脚本(Script)，其中有很多条命令，让Shell一次把这些命令执行完，而不必一条一条地敲命令。

**常见的Shell**

- Bash
Linux标准默认的shell。bash完全兼容sh，也就是说，用sh写的脚本可以不加修改的在bash中执行。
- sh
Unix 标准默认的shell
- ash
Linux中占用系统资源最少的一个小shell，它只包含24个内部命令，因而使用起来很不方便。 
- csh
其实是指向/bin/tcsh这样的一个shell，也就是说，csh其实就是tcsh。
- ksh

**Shell脚本语言与编译型语言的差异**

- Fortran、Ada、Pascal、C、C++和Java等都是**编译型语言**，需要预先将我们写好的源代码(source code)转换成目标代码(object code)，这个过程被称作“编译”。运行程序时直接读取目标代码，由于编译后的目标代码非常接近计算机底层，所以执行效率很高。但是，由于编译型语言多半运作于底层，所处理的是字节、整数、浮点数或是其他机器层级的对象，往往实现一个简单的功能需要大量复杂的代码。例如，在C++里，就很难进行“将一个目录里所有的文件复制到另一个目录中”之类的简单操作。 

- **解释型语言**也被称作“脚本语言”，如shell，python，ruby，perl，awk。执行这类程序时，解释器(interpreter)需要读取我们编写的源代码(source code)，并将其转换成目标代码(object code)，再由计算机运行。使用脚本编程语言的好处是，它们多半运行在比编译型语言还高的层级，能够轻易处理文件与目录之类的对象；缺点是它们的效率通常不如编译型语言。


 **变量类型**

运行shell时，会同时存在三种变量：
1) 局部变量
局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2) 环境变量
所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3) shell变量
shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行 


**注释**

sh里没有多行注释，只能每一行加一个#号。

如果在开发过程中，遇到大段的代码需要临时注释起来，过一会儿又取消注释，怎么办呢？每一行加个#符号太费力了，可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。 

**深入重定向**

一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：
- 标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
- 标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
- 标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。

默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file。如果希望 stderr 重定向到 file，可以这样写：

```
$command 2 > file
```


如果希望 stderr 追加到 file 文件末尾，可以这样写：

```
$command 2 >> file
```

2 表示标准错误文件(stderr)。如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：

```
$command > file 2>&1
```

或

```
$command >> file 2>&1
```

如果希望对 stdin 和 stdout 都重定向，可以这样写：

```
$command < file1 >file2
```

command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。 










