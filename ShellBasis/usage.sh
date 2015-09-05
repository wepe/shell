#!/bin/bash
# 这里的“#!”是约定的标记，告诉系统这个脚本需要/bin/bash这个解释器

echo "Enter a number:"
read num  #读入变量
echo "Number: $num"
echo  #输出空行
name="wepon" #等号左右不能有空格
echo "my name is ${name}!"  #使用变量时加$,{}可选，建议加上


readonly name  #name变成只读变量，不能对其赋值

unset num #不能删除只读变量name
echo ${num}  #被删除后，echo输出空行

echo $$  # 特殊变量名$表示当前Shell进程的ID，即pid
echo $0  # 当前脚本的文件名

echo $1  # 变量$n，传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1
echo $#  #传递给脚本或者函数的参数个数
echo $*  #传递给脚本或者函数的所有参数
echo $@  #传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同
echo $?  #上个命令的退出状态，或函数的返回值。成功会返回 0，失败返回 1。

#$* 和 $@ 都表示传递给函数或脚本的所有参数，不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
#但是当它们被双引号(" ")包含时，"$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；
#"$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。
for var in $*
do 
    echo "${var}"
done

for var in "$*"
do 
    echo "${var}"
done


#转义字符。这里 -e 表示对转义字符进行替换。如果不使用 -e 选项，将会原样输出
echo -e "Value of a is 10 \n"
echo "Value of a is 10 \n"
echo -e "\\"  # \\ 反斜杠
echo -e "abc\bd"  #\b退格，输出abd
echo -e "abc\td"  #\t制表符


#命令替换，是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。
#语法：`command`

DATE=`date`
echo "${DATE}"



# 变量替换，变量替换可以根据变量的状态（是否为空、是否定义等）来改变它的值
tmp="temp"
echo ${tmp}
tmp="1"
echo ${tmp:-word}  #如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。
echo ${tmp:=word}  #如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。


#运算符左右必须有空格

#算术运算符
val=`expr 1 + 2`  #expr 是一款表达式计算工具，使用它能完成表达式的求值操作
echo ${val}
expr 5 + 5  #输出10

a=2
b=3
expr $a + $b  #输出5
expr $a \* $b  #乘
expr $a / $b  #除
expr $a % $b  

if [ $a != $b ]
then
echo "a is not equal to b"
fi


#关系运算符 -eq,-ne,-gt,-lt,-ge,-le
if [ $a -le $b ]
then
echo "$a -le $b: a is less or equal to b"
else
echo "$a -le $b: a is not less or equal to b"
fi

#字符串运算符
#if [ $a = $b ]
#if [ $a != $b ]
#if [ -z $a ]  检测字符串长度是否为0，为0返回 true。
#if [ -n $a ]  检测字符串长度是否为0，不为0返回 true
#if [ $a ]  检测字符串是否为空，不为空返回 true


#文件运算符
#if [ -e $file ] 检测文件（包括目录）是否存在，如果是，则返回 true。
# -s file  是否为空
# -r file,-w file,-x file  是否可读,写，执行
# -d file 是否是目录
# -f file 是否是普通文件（既不是目录，也不是设备文件）

#注释，只能单行注释
func(){
如果在开发过程中，遇到大段的代码需要临时注释起来，过一会儿又取消注释，怎么办呢？每一行加个#符号太费力了，
可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。 
}

#字符串
#######
a=1
str='this is $a'  #单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
                  #单引号字串中不能出现单引号（对单引号使用转义符后也不行）
echo $str
str="a is \" $a \""   #双引号里可以有变量
                        #双引号里可以出现转义字符
echo $str


#获取字符串长度
string="abcd"
echo ${#string} #输出 4
#提取子字符串
string="alibaba is a great company"
echo ${string:1:4} #输出liba
#查找子字符串
string="alibaba is a great company"
echo `expr index "$string" is`



#数组
#bash支持一维数组（不支持多维数组），并且没有限定数组的大小。类似与C语言，数组元素的下标由0开始编号。获取数组中的元素要利用下标，下标可以是整#数或算术表达式，其值应大于或等于0。 

array=(1 2 3 4 "5")  #用括号来表示数组，数组元素用“空格”符号分割开
echo $array  #输出第一个元素
echo ${array[0]}  #输出第一个元素
echo ${array[*]}  #输出所有元素，也可用@
array[5]=6     #添加元素
echo ${array[5]}
length=${#array[*]} #获取数组长度
echo $length



#echo命令
#echo是Shell的一个内部指令，用于在屏幕上打印出指定的字符串。
#########
echo "It is a test" > myfile  #显示结果重定向至文件
echo `date` #显示命令执行结果


#printf
#printf 命令用于格式化输出， 是echo命令的增强版。它是C语言printf()库函数的一个有限的变形，并且在语法上有些不同。
########
printf "Hello, Shell\n"   #printf 不像 echo 那样会自动换行，必须显式添加换行符(\n)。
printf "%d %s\n" 1 "abc"
printf '%d %s\n' 1 "abc"   # 单引号与双引号效果一样 

# 没有引号也可以输出
printf %s abcdef
# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def
printf "%s\n" abc def
printf "%s %s %s\n" a b c d e f g h i j


#if..else语句
#[ expression ], []与expression必须有空格
a=2
b=1
if [ $a == $b ]
then
  echo "a equal to b"
elif [ $a -gt $b ]
then
  echo "a > b"
else
  echo "a < b"
fi


#case语句
read num
case num in
1|2|3)echo "num in 1 2 3"
;;  #;; 与其他语言中的 break 类似，意思是跳到整个 case 语句的最后。
4)echo "num is 4"
;;
*)echo "num is other number"  #如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令
;;
esac

#另一个例子，对参数进行判断
func(){
option="${1}"
case ${option} in
-f) FILE="${2}"
echo "File name is $FILE"
;;
-d) DIR="${2}"
echo "Dir name is $DIR"
;;
*)
echo "`basename ${0}`:usage: [-f file] | [-d directory]"
exit 1 # Command to come out of the program with status 1
;;
esac
}

#for循环语句：  for 变量 in 列表
for i in 1 2 3 4
do
  echo $i
done

for s in "a b c"
do
  echo $s
done


#显示主目录下以 .bash 开头的文件
for FILE in $HOME/.bash*
do
  echo $FILE
done



#while语句
cnt=0
while [ $cnt -lt 3 ]
do
  cnt=`expr $cnt + 1`
  echo $cnt
done

while read num
do
  echo "your input is $num,type <CTRL -D> to terminate"
done


#until语句.
#执行do后的语句，直到满足until后的条件
a=1
until [ ! $a -lt 5 ]  #输出a直到a不小于5
do
  echo $a
  a=`expr $a + 1`
done



#函数
func1(){
echo "call func1"
}

func2(){
func1
echo "call func2"
return 0   #函数返回值，可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。
}          #Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。

func2

unset  func2  #删除函数


#函数参数
#在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...
params(){
echo "number of params: $#"
echo "all params: $*"
echo "all params: $@"
echo "first parameter is $1"
echo "second parameter is $2"
}

params 1 2
echo $?  #函数返回值


#输出重定向
ls -l>file1  #如果不存在file1则创建，存在则覆盖
who>>file1   #追加
#输入重定向
echo "输入重定向："
ls -l < file1 

