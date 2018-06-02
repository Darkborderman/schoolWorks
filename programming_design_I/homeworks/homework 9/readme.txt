※clock.c為計算clock的function使用範例

在input中包含一些prefix是沒有length的
x.0.0.0 這種prefix表示length是8
x.y.0.0 length是16 
x.y.z.0 lenght是24
x.y.z.w length是32

In the input file，some of the prefix has no length means that 
x.0.0.0 is of length 8, 
x.y.0.0 is of length 16, 
x.y.z.0 is of length 24, 
x.y.z.w is of length 32