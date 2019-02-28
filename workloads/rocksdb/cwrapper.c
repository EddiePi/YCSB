#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<sys/mman.h>
#include<unistd.h>
#define MAX_LINE 1024
void commandline(int argc, char *argv[], char* command);
int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		printf("please specify the shell command\n");
		return -1;
	}
	pid_t pid = getpid();
	printf("pid: %d\n", pid);
	mlockall(MCL_FUTURE);
	char command[200];
	commandline(argc, argv, command);
	printf("command: %s\n", command);
	//system(command);
	
	FILE *fp;
	fp = popen(command, "r");
	char strLine[MAX_LINE];
	while (!feof(fp))
	{
		fgets(strLine,MAX_LINE,fp);
		printf("%s", strLine);
	}
	while(1)
	{
		char exit;
		printf("exit? y/n\n");
		scanf("%c", &exit);
		if (exit == 'y' || exit == 'Y')
		{
			break;
		}
	}
	munlockall();
	return 0;
}

void commandline(int argc, char *argv[], char* command)
{
	command[0] = '\0';
	for (int i = 1; i < argc; i++)
	{
		strcat(command, argv[i]);
		strcat(command, " ");
	}
}
