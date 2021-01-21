/*
 Autor: Andrés Aldana
 www.github.com/aldanasilva
 Archivos de origen:
  - 20200816 - Untitled-1.java
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class HelloWorld
{
    public static void main(String args[]) throws Exception
    {
        System.out.print("Ingrese dos número enteros:\n");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int a = Integer.parseInt(br.readLine());
        int b = Integer.parseInt(br.readLine());
        
    }
}
