﻿using System;

class Program
{
    static void Main()
    {
        int a = int.Parse(Console.ReadLine());
        int b = int.Parse(Console.ReadLine());
        int c = int.Parse(Console.ReadLine());
        long result = 0;

        if (b == 2)
        {
            result = a % c;
            if (result % 4 == 0)
            {
                Console.WriteLine("{0}\n{1}", result/4, result);
            }
            else
            {
                Console.WriteLine("{0}\n{1}", result%4, result);
            }
        }
        else if (b == 4)
        {
            result = a + c;
            if (result % 4 == 0)
            {
                Console.WriteLine("{0}\n{1}", result/4, result);
            }
            else
            {
                Console.WriteLine("{0}\n{1}", result%4, result);
            }
        }
        else if (b == 8)
        {
            result = (long)a * c;
            if (result % 4 == 0)
            {
                Console.WriteLine("{0}\n{1}", result/4, result);
            }
            else
            {
                Console.WriteLine("{0}\n{1}", result%4, result);
            }
        }
    }
}

