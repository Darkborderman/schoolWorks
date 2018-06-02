using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice_Tower_of_Hanoi
{
    class Program
    {
        private static void Hanoi(int n,char a,char b,char c)
        {
            if(n == 1)
            {
                Console.WriteLine("Move Sheet from {0} to {1}",a,c);
            }

            else
            {
                Hanoi(n - 1, a, c, b);
                Console.WriteLine("Move Sheet from {0} to {1}",a,c);
                Hanoi(n - 1, b, a, c);
                //Console.WriteLine("Move Sheet from {0} to {1}", a, b);

            }
        }

        static void Main(string[] args)
        {
            int n;
            Console.Write("請輸入盤數 : ");
            n = int.Parse(Console.ReadLine());

            Hanoi(n, 'A', 'B', 'C');

            Console.ReadLine();
        }
    }
}
