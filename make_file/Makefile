CC = gcc
XX = g++
CFLAGS = -Wall -O -g

TARGET = ./helloworld

%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
%.o:%.cpp
	$(XX) $(CFLAGS) -c $< -o $@

SOURCES = $(wildcard *.c *.cpp)
OBJS = $(patsubst %.c, %.o, $(patsubst %.cpp, %.o, $(SOURCES)))

$(TARGET):$(OBJS)
	$(XX) $(OBJS) -o $(TARGET)
	
	chmod a+x $(TARGET)

clean:
	rm -rf *.o $(TARGET)
