CC=gcc
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=main.c levenstein_distance.c helper.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=main.out
PYTHON_EXECUTABLE=python3.5
TESTS_ROOT=tests
TEST_RESULTS=results


all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS)

test:
	python3.5 -mrobot --variable APP_EXECUTABLE_NAME:$(realpath $(EXECUTABLE)) --pythonpath $(TESTS_ROOT)/resources -d $(TEST_RESULTS) $(TESTS_ROOT)/testcases/*.robot
