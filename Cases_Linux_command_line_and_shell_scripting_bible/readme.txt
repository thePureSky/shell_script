Linux划分为以下四部分：
Linux内核
GNU工具组件
图形化桌面环境
应用软件

Linux内核主要负责：
系统内存管理
软件程序管理
硬件设备管理
文件系统管理

GNU coreutils(Linux的核心工具 coreutils（core utilities）)：
用于处理文本的工具
用于操作文本的工具
用以管理进程的工具

Linux桌面环境：
X Window系统
KDE桌面
GNOME桌面
其他：
fluxbox
xfce
JWM
fvwm
fnwm95

Linux发行版：
核心Linux发行版（大量可选配置）
专业Linux发行版（傻瓜式不解释……）
Linux LiveCD（体验，部分可写磁盘）

文本命令行界面（CLI Command Line interfece）

stat filename文件统计信息
file filename文件类型

ps kill killall

printenv 查看全局环境变量

set：设置局部环境变量（为某进程）

unset：删除环境变量，注意不要用美元符
如：unset test


设置局部环境变量：
test=testing
echo $test

设置全局环境变量：
export


定位系统环境变量：
1）登陆shell：
/etc/profile
$HOME/.bash_profile(会调用$HOME/.bashrc)
$HOME/.bash_login
$HOME/.profile
2）交互式shell（bash）
$HOME/.bashrc
3）非交互式shell
BASH_ENV环境变量(默认不设置)


bash shell可变数组：
mytest=(one two three four five)
echo ${mytest[2]}
echo ${mytest[*]}
unset ${mytest[1]}(其实还占着位置)

一行多个命令，分号隔开

反引号，将命令输出赋值给变量

重定向：
>覆盖
>>追加

<输入重定向
<<内联输入重定向
 
管道
command | command

数学运算：
1)使用方括号（只支持整数运算）,见test7
${ operation }
2）浮点运算使用bc
2.1）使用反引号，见test10
2.2）使用反引号+内联输入重定向，见test12

最后一条命令的状态码：$?
自定义状态码:最后用 exit value;（注：value为0~255的值，若大于则会取模），见test12


结构化命令
1）if-then语句
if command
then
	commands
fi
或者
if commmand; then
	commmands
fi
执行条件：如果command的退出状态吗为0，则执行，否则不执行commands，见11_test2

2）if-then-else语句,见11_test4
if command
then
	commands
else
	commands
fi

3)嵌套if
if command1
then
	command set 1
elif command2
then
	command set 2
elif command3
then
	command set 3
elif command4
then
	command set 4
fi

4)test命令
if test condition
then
	commands
fi
或者bash shell提供了一种方法,注意括号前后要有空格
if [ condition ]
then
	commands
fi

test命令可以判断3类条件：
数值比较
字符串比较
文件比较

4.1)数值比较，-eq,-ge,-gt,-le,-lt,-ne（注意bash shell无法处理浮点运算，要是将bc算出的3.33 -gt 3, 会报错），见11_test5

4.2)字符串比较,注意大于小于号要必须转义，否则会当作重定向符号。大小写符号顺序与sort命令所采用的不同，见11_test8。未定义变量默认长度为0
= ！= < >
-n str10
-z str1

4.3)文件比较
-d file是否存在并且是一个目录 
-e file是否存在
-f file是否存在并且是一个文件

4.5）复合条件测试，见11_test22
[ condition1 ] && [ condition2 ]
[ condition1 ] || [ condition2 ]

4.6)if-then的高级特性,见11_test23
双圆括号：用于数学表达式：
	(( expression )) , expression可以是任意的数学赋值或比较表达式
双方括号：用于高级字符串处理
	[[ expression ]] , 可以模式匹配

4.7)case 命令， 见11_test26
case variable in
pattern1 | pattern2) commands1;;
pattern3) commands2;;
*) default commands;;
esac

更多的结构化命令
1）for命令
for var in list
do
	commands
done
或者
for var in list; do done
1.1)读取列表中的值，循环变量的值会一直保存，直至被改变，见12_test1
1.2）读取列表中复杂值，用转义符号处理单引号，或者用双引号括起来.见12_test2
1.3）从变量中读取列表，注意变量扩展, 见12_test4
1.4）从命令读取值,用反引号执行任何能产生输出的命令，见12_test5
1.5）更改字段分隔符（internal field sepatator，IFS）,见12_test6
默认bash shell会把以下字符当作字段分隔符：空格，制表符，换行符。
处理IFS最好先将旧的IFS存起来，
IFS.OLD=$IFS
IFS=$'\n'
<use the new IFS value in code>
IFS=$IFS.OLD
赋值IFS方法：
单个，IFS=：
多个，IFS=$'\n:;"'，（会把换行符，冒号，分号和双引号当作字段分隔符）
1.6）用通配符读取目录，然后判断是文件还是目录,注意循环变量要用冒号括起来，因为文件名可以含有空格。

2）C语言式的for命令
for (( variable assignment; condition; iteration process ))，可以定义多个变量，双括号内可以不加美元符，见12_test8

3)while 命令.循环变量必须改变，var1=$[ $var1 - 1 ]见12_test10,
while test command
do
	other commands
done

3.2)使用多个测试命令，注意每个测试命令都在单独的一行上。见12_test11

4)until命令
until test commands
do
	other commands
done

4.2)until使用多个测试命令时，shell会在最后一个命令成立时停止。见12_test13


5)嵌套循环，见12_test14

6)循环处理文件数据，改变IFS，循环，见12_test16

7)控制循环
7.1）break命令
跳出1个循环，见12_test17
跳出多个循环，break n (n为跳出的循环层数)，见12_tes20

7.2) continue命令
提早结束一层循环，见12_test21
指定继续哪级循环，continue n （n为往上多少层，同break）见12_test22

8）处理 循环的输出 12_test23, 12_test24

处理用户输入
1）命令行参数
1.1）读取参数，$0,$1,$2,...,$9,${10}，$0是程序名，参数从1开始，若大于10，要加花括号。见13_test1-4

1.2) 读取程序名
采用name=`basename $0`获得程序名字。见13_test5

2)特殊参数变量
1)参数计数
$#代表参数个数，${!#}表示最后一个参数值，花括号内不能用美元符，见13_test10

2)抓取所有的数据，见13_test12
$*:所有参数会当作一个变量，但是for循环不可遍历
$@:所有参数会当作一个变量，但是for循环可遍历

3）移动变量，见12_test14
shift
shift 2

4)处理选项
4.1）查找选项
处理简单选项，见13_test15
分离参数和选项，见test_16
处理带值的选项，见test_17

4.2）使用getopt命令
命令的格式：getopt optstring options parameters, 如 getopt -q ab:cd -a -b test1 -cde test2 test3
在脚本中使用getopt： set -- `getopt -q ab:c "$@"`,见13_test18,注：getopt会把空格当作参数分隔符，而不是根据双引号将二者当作一个参数，如"test1 test2"会当作两个参数
使用更高级的getopts（cool。。。。）：

5）标准化
遵守Linux通用的命令选项

6）获得用户输入
6.1）基本的读取，见13_test21
6.2）超时
-t参数，见13_test25
-n1,只输入单个字符，不需回车键，见13_test26
6.3) 隐藏方式读取，如读取密码，见13_test27
6.4) 读取文件， 见13_test28


呈现数据
1）理解输入和输出
0 STDIN    标准输入
1 STDOUT   标准输出
2 STDERR   标准错误
示例；
ls -al test test2 test3 badtest 2> test_error 1> test_stdout （错误和标准输出分开）
ls -al test test2 test3 badtest &> test_err_stdout （标准输出和错误都在，注意错误的优先级比较高，会排在前面87）

2）在脚本中重定向输出
2.1）临时重定向 echo "d" >&2,见14_test1
2.2) 永久重定向，exec 1>testout, 见14_test2

3）在脚本中重定向输入，exec 0<test，见14_test12

4)创建子记得重定向
4.1)exec 3> test_3
echo "The " >&3
也可以追加，如exec 3>>test_3

4.2)将输出临时重定向，然后将输出恢复，做法是先存储STDOUT，见14_test14

4.3)将输入临时重定向，然后将输入恢复，做法是先存储STDIN，见14_test15

4.4)创建读写文件描述符，小心使用，会根据文件当前位置读写

4.5）关闭文件描述符，exec 3>&-, 见14_test17

5)列出打开的文件描述符,见14_test18
lsof,/usr/bin/lsof
lsof -a -p $$ -d 0,1,2

6)阻止命令输出，/dev/null
ls -al badfile test 2> /dev/null
cat /dev/null
cat /dev/null > testfile（快速清除文件）

7)创建临时文件，/tmp目录，系统启动自动删除里面的所有文件，任何账户都可以在/tmp目录读写， mktemp命令，filename.XXXXXX
7.1）创建本地临时文件，见14_test19,这些文件只能手动删除
7.2）在/tmp目录创建临时文件，-t参数，见14_test20
7.3）创建临时目录，然后通过cd命令进入，见14_test21

8)记录消息， tee命令
tee filename
ls | tee -a filename


控制脚本
1）处理信号
1.1)常见信号
1.2)产生信号，
Ctrl+C SIGINT 终止进程
Ctrl+Z SIGSTP 暂停进程

ps au
kill -9 PID
fg

1.3)捕捉信号， trap commands signals
捕捉Ctrl+C，见15_test1
捕捉脚本的退出，见15_test2
移动捕捉，见15_test3，类似于停止捕捉

2）以后台模式运行脚本， &
ps au

3）在非控制台下运行脚本，nohup ./test1 &， nohup.out
实际上是阻断所有发送给该进程的SIGHUP信号

4）作业控制
4.1）查看作业，jobs命令，+号表示默认的作业

4.2）重启停止的作业
bg 2：以后台模式重启，2为作业号
fg 3：以前台模式重启。3为作业号

5）调整谦让度，优先级是整数值，从-20（最高优先级）到+19（最低优先级）。默认bash shell以优先级0启动。通过nice 命令调整优先级,如果没有root权限，那么只能降低优先级。
运行时指定：nice -n -10 ./test4
改变已运行命令的优先级：renice 10 -p PID

6）定时运行作业
6.1）用at命令计划执行作业
at的守护进程atd，atd检查/var/spool/at，每60s检查一次
at命令的格式：at [-f filename] time, 26种作业队列，a~z(排序越高，优先级越低)，-q参数指定队列
atq 查看作业队列
atrm 1 删除作业

6.2）计划定期执行脚本,脚本要全路径名
cron程序，会自动检查cron时间表（cron table）
cron时间表
min hour dayofmonth month dayofweek command
可以使用范围，通配符。
15 10 * * * command 每天10：15执行
15 16 * * 1 command 每周一执行，可以用三字符（mon,tue,wed, thum fri, sat, sun）或者数值(0为周日,6为周六，指定dayofweek)
最后一天执行：
00 12 * * * if [ `date +%d -d tomorrow`=01 ]; then ; command; fi

cron目录(每天，每小时，每月)

anacron，错过作业后会尽快运行作业，而cron不会运行错过的作业。anacron只会运行位于cron目录的程序。/var/spool/anacron

7)启动时运行
7.1）开机时运行脚本
启动过程，第一件事：开始UNIX的System V init过程或者Upstart init过程
定义自己的开机脚本
debian /etc/init.d/rc.load
Fedora /etc/rc.d/rc.local
Mandriva /etc/rc.local
openSuse /etc/init.d/boot.local
Ubuntu /etc/rc.local

7.2)新shell中启动
.bash_profile文件：新登陆产生
.bashrc文件，新shell启动
/etc/bashrc:每当有用户启动shell，都会执行。


创建函数
1）基本的脚本函数,bash shell 会将函数当作小型脚本来对待
function name {
	commands
}
或者
name() {
	commands
}

2)返回值
2.1)默认退出状态码，函数的最后一条命令执行状态码，用$?
2.2)使用return命令，注意要在0~255之间
2.3）使用函数输出，用变量存储，如result=`function1` (反引号执行函数)

3）在函数中使用变量
3.1）向函数传递参数，同样是$1,$2 ...
3.2）在函数中处理变量，作用域
全局变量：默认全部变量都是全局变量，不管是在函数内还是函数外。
局部变量：不用在函数内使用全局变量，使用local关键字.这样不会改变函数外的变量值。见16_test9

4)数组变量和函数
4.1）向函数传数组参数，先见变量值传过去，然后重建数组，见16_test11
4.2）从函数返回数组，同样道理，先echo，然后在脚本中重建数组，见16_test12

5）函数递归
局部变量：自成体系（self-containment），阶乘，见16_test13

6)创建库，如果是直接./script，那么脚本定义的函数在当前shell是不能使用的，应该用source命令，source命令有个快捷别名，称作点操作符（dot operator）
如 .  ./16_myfuncs, 见16_test14

7)在命令行上使用函数
7.1）在命令行上创造函数（尽量不要覆盖内建命令）
一行内：function addem { echo $[ $1 + $2 ]; },每句命令后要有分号
多行：每个命令后按回车键，不需要分号。

7.2）在.bashrc文件中定义函数
直接在.bashrc中定义函数
读取函数文件，用source 或者 .


初识sed和gawk--文本文件编辑器
1）文本处理
1.1）sed编辑器--流编辑器（stream editor）,会对每行文本执行
sed options script file
-e script:script 可能有多条命令，用分号隔开，或者采用次提示符，输入单引号后回车。
-f file：文件file包含script，每一行一条指令
-n 不要为每个命令生成输出
注：自身不会修改文本文件的数据

1.2）gawk程序--原始awk程序的GNU版本，提供了一种编程语言而不只是编辑器命令，同样会对每行文本执行
gawk options program file
program用单引号，花括号括起来，如 gawk '{print "Hello John!"}' 
EOF:（end-of-file）Ctrl+D组合键，表示数据流已经结束了
gawk '{print $1}' test
$0:代表整个文本行
$1:第一个数据字段
$2:第二个数据字段
$n:第n个数据字段

-f 读取脚本（即program）
-F fs 字段分隔符
多条命令：用分号隔开
echo "My name is Rich" | gawk '{$4="Christine"; print $0}'

可以交互式：输入‘{ 后回车
处理数据前后执行：
gawk 'BEGIN {print "The test file Contents:"} {print $0} END {print "End of file"}' test
生成专业报告？？！！
一个有BEGIN， 主体，END的脚本程序，见18_script4 (gawk -f 18_script4 /etc/passwd)

2）sed编辑器基础 
2.1）更多的替换选项
's/old-str/new-str/'：默认只替换该行的第一个匹配串

s/pattern/replacement/flags
替换标记（substitution flag）
数字：替换该行的第几处
g：替换所有地方
p：原来行的内容要打印出来（与-n一起使用）
w file：替换结果写回文件（只会写改变的行）

替换字符：如果字符串中出现正斜线，用\转义，但是容易困惑，所以可以用其他字符作为字符串分隔符
如以下等价：
sed 's/\/bin\/bash/\/bin\/csh/' /etc/passwd
sed 's!/bin/bash!/bin/csh!' /etc/passwd

2.2)使用地址
行寻址（line addressing）: [address]command
行的数字范围:第一行为1s; sed '2s/dog/cat/' data1;sed '2,3s/dog/cat/' data1;sed '2,$s/dog/cat/' data1;($表示到最后一行)
用文本模式来过滤出某行:/pattern/command; sed '/Samantha/s/bash/csh' /etc/passwd （只会修改包含"Samantha"文本的行上）
组合命令，用{}

2.3)删除行 'd'
sed '3d' data7 （删除第三行）（如果没加地址，会把整个文件删除）
或者匹配：sed '/number 1/d' data7

用两个文本模式删除某个范围的行：(可以多次触发)
sed '/1/,/3/d' data7

2.4）插入和附加文本
插入（insert）命令i会在指定行前增加一个新行
追加（append）命令a会在指定行后增加一个新行

在某一行前插入多行文本：用\转义

2.5）修改行
c

2.6）转换命令
y， 处理单个字符的sed编辑器命令，全局的

2.7)回顾打印
打印行，sed 'p' data1
可以将原行与修改后的行打印出，sed -n '/3/{p; s/line/test/p}' data7
打印行号，'=' sed '=' data1
列出行：l，允许打印文本和不可打印字符（用八进制加反斜线等）sed -n 'l' test

2.8）用sed与文件一起工作
读 [address]w filename; sed '1,2w test' data7
写 [address]r filename; sed '3r data12' data7
读写一起（替换） sed '/LIST/{r data11; d}' letter


正则表达式--熟练使用正则表达式的关键
1）正则表达式：定义的用来过滤文本的模式模板，用正则表达式引擎（regular expression engine，一种底层软件）实现的。
POSIX基本正则表达式（BRE）引擎（sed只实现了这个）
POSIX扩展正则表达式（ERE）引擎（gawk处理）

2）定义BRE模式(凡是特殊字符，都要考虑是否要转义)
空格也会当作普通字符看待
锚字符：
锁定在行首， 脱字符（caret character,^）
锁定在行尾，美元符($)
组合锚点，如删除空白行：sed '/^$/d'data5

点字符：必须匹配一个字符
字符组(character class),方括号[abc]，表示方括号内一定并且只出现一个字符

排除字符组，[^ch]，排除c、h两个字符

使用区间 [0-9] [c-h]

特殊字符组
[[:alpha:]]     匹配任意字母字符，不管大小写
[[:alnum:]]     匹配任意字母数字字符0~9、A~Z、a~z
[[:blank:]]     匹配空格或制表符
[[:digit:]]     匹配0~9之间的数字
[[:lower:]]     匹配小写字母a-z
[[:print:]]     匹配任意可打印字符
[[:punct:]]     匹配任意标点符号
[[:space:]]     匹配任意空白字符：空格、制表符、NL、FF、VT和CR
[[:upper:]]     匹配任意大写字母A-Z

星号：该字符出现0次或多次，也可用于字符组中

3）扩展正则表达式（gawk可以识别，但是sed无法识别，但sed比gawk快）
问号，？,匹配0个或者1个字符

加号：+，出现一次或者多次

使用花括号，指定区间（interval）（gawk必须指定 --re-interval 参数，否则无法识别        ）
m，准确出现m次
m，n 至少出现m次，最多出现n次

管道符号：逻辑OR方式
echo "The dog is asleep" | gawk '/cat|dog/{print $0}'

聚合表达式，括号    
echo "Saturday" |gawk '/Sat(urday)?/{print $0}'

几个示例：
目录文件计数，见19_test1
验证电话号码，见19_test2
解析邮件地址，见19_test3


sed进阶
多行处理
模式空间与保持空间，反转文本，见20_test1
跳转流
模式替代（and符号，替换单独的单词）
重定向sed的输出，为数字加逗号，见20_test2

加倍行间距，
sed '$!G' data2
sed '/^$/d;$!G' data6

给文件中的行编号，sed '=' data2 | sed 'N; s/\n/ /'

打印末尾几行，利用模式空间，N与D命令，sed '{:start;$q;N;11,$D;b start}' /etc/passwd
删除连续的空白行，sed '/./,/^$/!d' data6
删除开头的空白行，sed '/./,$!d' data7
删除结尾的空白行，sed '{:start; /^\n*$/{$d;N;bstart}; }'
删除HTML标签，sed 's/<[^>]*>//g;/^$/d' data.html


gawk进阶
gawk变量引用时不加美元符
内建变量，FS,RS,OFS,ORS,FIELDWIDTHS等
自定义变量

定义数组变量
var[index] = element
遍历数组变量(注意这里的var是索引值，而不是数组元素值)
for (var in array)
{
	statements
}
删除数组变量
deleter array[index]

匹配操作符，~
数学表达式，

结构化命令
if语句：
if （condition）
	statement1；
else 
	statement2

while语句：(支持continue和break)
while (condition)
{
	statements
}

do-while语句：
do
{
	statements
} while (condition)

for语句（C风格）：
for (variable assignment; condition; iteration process)
{
	statements
}
格式化打印，printf,同C语言编程
格式化指定符
d	以十进制形式输出带符号整数(正数不输出符号)
o	以八进制形式输出无符号整数(不输出前缀0)
x,X	以十六进制形式输出无符号整数(不输出前缀Ox)
u	以十进制形式输出无符号整数
f	以小数形式输出单、双精度实数
e,E	以指数形式输出单、双精度实数
g,G	以%f或%e中较短的输出宽度输出单、双精度实数
c	输出单个字符
s	输出字符串

-	结果左对齐，右边填空格
+	输出符号(正号或负号)
空格	输出值为正时冠以空格，为负时冠以负号
#	对c、s、d、u类无影响；
	对o类，在输出时加前缀o；
	对x类，在输出时加前缀0x；
	对e、g、f 类当结果有小数时才给出小数点。

gawk的内置函数
数学函数
字符串函数
时间函数
自定义函数（！，还可以设置函数库，gawk 用 -f 参数指定文件）

使用其他的shell
Dash shell，主要在Ubuntu Linux发行版中。精简版
bash shell 和dash shell都以Bourne shell为原型
dash shell不支持可变数组
要让环境变量在子shell或者子进程中可见，需用export命令
bash与dash区别
1）算术运算，dash不支持方括号
2）test命令，dash无法识别==
3）echo语句，bash要用-e识别制表符，而dash不需这个参数
4）dash不支持function关键字，只能以name（）{}方式定义函数


zsh shell：有Paul Falstad 开发的一个开源Unix shell
改进的shell选项处理
shell兼容性模式
可加载模块
增加了核心内建命令，提供了额外命令模块（command module）

图形化
dialog --inputbox "Enter your age:" 10 20 2>age.txt
dialog --inputbox "Enter your age:" 10 20 2>age.txt
dialog --title Testing --msgbox "This is a test" 10 20
dialog --title "please answer" --yesno "Is this thing on?" 10 20

zenity --calendar
