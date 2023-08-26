#include<stdio.h>
int mul(int a , int b)
{
    return (a+b);
}
int main()
{
    int m=20;
    int n=10;
    int s=mul(m,n);
    printf("Multiplication is = %d",s);   
    return 0;
}