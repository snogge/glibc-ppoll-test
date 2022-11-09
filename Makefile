VARIANTS += ppoll-test-plain
VARIANTS += ppoll-test-64bit
VARIANTS += ppoll-test-fortified
VARIANTS += ppoll-test-64bit-fortified

all: $(VARIANTS)

ppoll-test-64bit: CFLAGS += -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64
ppoll-test-fortified: CFLAGS += -D_FORTIFY_SOURCE -O
ppoll-test-64bit-fortified: CFLAGS += -D_FORTIFY_SOURCE -O
ppoll-test-64bit-fortified: CFLAGS += -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64

ppoll-test-%: ppoll-test.c Makefile
	$(LINK.c) $(OUTPUT_OPTION) $<

dump: $(addprefix dump-,$(VARIANTS))

dump-%: %
	objdump -wt $< | grep GLIBC
