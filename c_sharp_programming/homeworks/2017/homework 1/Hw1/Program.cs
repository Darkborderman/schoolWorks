using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hw1
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice;
            int i = 0;
            int j = 0;
            int p,q;
            int num = 0;
            string[] name = new string[10000];
            int[] chi = new int[10000];
            int[] eng = new int[10000];
            int[] math = new int[10000];
            int[] id = new int[10000];

            while (true){
                Console.WriteLine("1>輸入 2>印出 3>排序(以國文成績排序) -1>退出");
                choice = int.Parse(Console.ReadLine());

                if(choice == 1)
                {
                    if(i == 0) { 
                        Console.WriteLine("請輸入班級人數:(僅第一次輸入需要)");
                        num = int.Parse(Console.ReadLine());
                        Array.Resize(ref name, num);
                        Array.Resize(ref chi, num);
                        Array.Resize(ref eng, num);
                        Array.Resize(ref math, num);
                        Array.Resize(ref id, num);
                        i++;
                    }
                    else
                    {
                        Console.WriteLine("請輸入座號:");
                        id[j] = int.Parse(Console.ReadLine());
                        Console.WriteLine("請輸入姓名:");
                        name[j] = Console.ReadLine();
                        Console.WriteLine("請輸入國文成績:");
                        chi[j] = int.Parse(Console.ReadLine());
                        Console.WriteLine("請輸入英文成績:");
                        eng[j] = int.Parse(Console.ReadLine());
                        Console.WriteLine("請輸入數學成績:");
                        math[j] = int.Parse(Console.ReadLine());
                        j++;
                    }
                }

                else if(choice == 2)
                {
                    Console.WriteLine("座號  國文  英文  數學  姓名  ");
                    Console.WriteLine("******************************");
                    for (p = 0;p < num; p++)
                    {
                        Console.WriteLine("{0}     {1}     {2}     {3}     {4}",id[p],chi[p],eng[p],math[p],name[p]);
                    }
                }

                else if(choice == 3)
                {
                    int[] chi_1 = new int[chi.Length];
                    int[] chi_2 = new int[chi.Length];
                    int[] chi_3 = new int[chi.Length];

                    for (p = 0;p < num; p++)
                    {
                        chi_1[p] = chi[p];
                        chi_2[p] = chi[p];
                        chi_3[p] = chi[p];
                    }
                    Array.Sort(chi,id);
                    Array.Sort(chi_1, eng);
                    Array.Sort(chi_2, math);
                    Array.Sort(chi_3, name);
                }

                else if(choice == -1)
                {
                    break;
                }
                
            }
        }
    }
}
