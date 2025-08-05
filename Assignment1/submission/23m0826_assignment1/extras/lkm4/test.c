#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
	unsigned long PAGE_SIZE = (unsigned long)sysconf(_SC_PAGESIZE);
	char terminalCommand_ps[50];
	char terminalCommand_insmod[50];
	int PID = getpid();
	//int PID = 26833;

	printf("PID: %d\n", PID);
	printf("PAGE_SIZE: %lu KB\n", PAGE_SIZE<<10);

	// Allocate memory in stages
	for (int i = 1; i <= 101; i += 20)
	{
		//Increasing virtual memory (VSZ) of the process
		size_t allocSize_vsz = i * PAGE_SIZE;
		int *ptr = (int *)malloc(allocSize_vsz);
		int *iter=ptr;

		if (ptr == NULL)
		{
			perror("malloc");
			return 1;
		}


		//Increasing physical memory (RSS) of the process
		size_t allocSize_rss= sizeof(int);
		for(int k=1; allocSize_rss*k <= allocSize_vsz; k++){
			*iter = k;
			iter++;
		}

		printf("\n\n================ Execute ===================\n");
		printf("Allocated %lu KB of memory\n", allocSize_vsz >> 10);


		sprintf(terminalCommand_ps,"ps -p %d -o pid,vsz,rss",PID);
		sprintf(terminalCommand_insmod,"sudo insmod lkm4.ko target_pid=%d",PID);

		system("sudo rmmod lkm4.ko");
		system("sudo dmesg -C");
		system(terminalCommand_insmod);
		system("sudo dmesg");
		system(terminalCommand_ps);
		system("sudo rmmod lkm4.ko");

		free(ptr);
		ptr=iter=NULL;

		printf("================= End ====================\n\n");

		sleep(5);

	}

	return 0;
}
