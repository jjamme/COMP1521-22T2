#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	char *home_path = getenv("HOME");
	if (home_path == NULL) {
		home_path = ".";
	}

	char *diary_name = ".diary";
	int diary_path_len = strlen(home_path) + strlen(diary_name) + 2;

	// $HOME/.diary
	char diary_path[diary_path_len];
	snprintf(diary_path, diary_path_len, "%s/%s", home_path, diary_name);

	FILE *fp = fopen(diary_path, "r");
	if (fp == NULL) {
		perror("");
		return 1;
	}

	int ch;
	while ((ch = fgetc(fp)) != EOF) {
		fputc(ch, stdout);
	}

	fclose(fp);
}
