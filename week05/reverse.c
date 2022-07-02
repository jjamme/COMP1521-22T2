#include <assert.h>
#include <stdio.h>

unsigned int reverseBits(unsigned int w) {
	unsigned int ret = 0;

	for (int i = 0; i < 32; i++) {
		unsigned int a = 1 << (32 - i - 1);
		unsigned int b = 1 << i;

		if (a & w) {
			ret = ret | b;
		}
	}

	return ret;
}



int main(){
	unsigned int w = 0x01234567;

	assert(reverseBits(w) == 0xE6A2C480);
	printf("reversed 0x%x to 0x%x", w, reverseBits(w));

	return 0;
}
