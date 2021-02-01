# Example directory names start with a digit
EXAMPLE_DIRS = $(wildcard [0-9]*/)

all:
	for dir in $(EXAMPLE_DIRS); do                                          \
		echo;                                                               \
		echo "---------- Running example $$dir -------------" ;             \
		$(MAKE) -C $$dir all;                                               \
	done

clean:
	for dir in $(EXAMPLE_DIRS); do                                          \
		echo;                                                               \
		echo "------- Cleaning example $$dir ----------------" ;            \
		$(MAKE) -C $$dir clean;                                             \
	done
