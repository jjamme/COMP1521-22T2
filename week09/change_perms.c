#include <stdio.h>
#include <sys/stat.h>
#include <stdlib.h>

void remove_public_write(char *filename) {
	struct stat s;

	if (stat(filename, &s) != 0) {
		perror("");
		exit(1);
	}

	mode_t mode = s.st_mode;

	int oth_write = mode & S_IWOTH;

	if (!oth_write) {
		printf("others can't write to %s\n", filename);
		return;
	}

	printf("removing other write permissions");

	mode_t new_mode = mode & ~S_IWOTH;

	int is_chmod = chmod(filename, new_mode);

	if (!is_chmod) {
		perror("");
		exit(1);
	}
}

int main(int argc, char *argv[]) {
	for (int arg = 1; arg < argc; arg++) {
		remove_public_write(argv[arg]);
	}
}
