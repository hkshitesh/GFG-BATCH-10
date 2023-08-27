#include<stdio.h>
int div(int a , int b)
{
    int m=10;
    return (a/b);
}
int main()
{
    int m=20;
    int n=10;

    int s=div(m,n);
    printf("Multiplication is = %d",s);   

    return 0;
}