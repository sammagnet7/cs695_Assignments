#include<stdio.h>
#include<unistd.h>


int main(){
	int a=13545464;
	printf("PID:%d\n",getpid());
	printf("VA:%p\n",(void *) &a);

	sleep(10);
	printf("Process with PID %d exited\n",getpid());
	return 0;
}
