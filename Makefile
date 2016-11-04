CC=gcc
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=main.c levenstein_distance.h
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=main.out

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(OBJECTS)
