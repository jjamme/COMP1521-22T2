#include <spawn.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>

extern char **environ;

void spawn_process(char **args) {
	pid_t pid;
	int status;

	if ((status = posix_spawn(&pid, args[0], NULL, NULL, args, environ)) != 0) {
		errno = status;
		perror("");
		exit(EXIT_FAILURE);
	}

	if (waitpid(pid, &status, 0) == -1) {
		perror("");
		exit(EXIT_FAILURE);
	}
}

int main() {
	spawn_process((char *[]){"/bin/date", "+%d-%m-%Y", NULL});
	spawn_process((char *[]){"/bin/date", "+%T", NULL});
	spawn_process((char *[]){"/bin/whoami", NULL});
	spawn_process((char *[]){"/bin/hostname", "-f", NULL});
}
