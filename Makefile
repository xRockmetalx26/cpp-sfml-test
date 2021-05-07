C_FILES         := $(wildcard src/*.c)
CPP_FILES       := $(wildcard src/*.cpp)
RC_FILES        := $(wildcard res/*.rc)
O_FILES         := $(subst .c,.o,$(C_FILES)) $(subst .cpp,.o,$(CPP_FILES)) $(subst .rc,.o,$(RC_FILES))
LIB_FILES       := $(wildcard lib/*.a) $(wildcard lib/*.*.a)

C_FLAGS         := -std=c18 -pedantic -Wextra -Wall -O3
CPP_FLAGS       := -std=c++2a -pedantic -Wextra -Wall -O3

# -I"your-directory" add include directory (files .h) (HEADERS)
INCLUDE_DIRECTORIES  := -Iinclude 

app: $(O_FILES)
	g++ $^ -o $@ $(LIB_FILES)

%.o: %.c
	gcc -c $^ -o $@ $(INCLUDE_DIRECTORIES) $(C_FLAGS)

%.o: %.cpp
	g++ -c $^ -o $@ $(INCLUDE_DIRECTORIES) $(CPP_FLAGS)

%.o: %.rc
	windres $^ -o $@ $(INCLUDE_DIRECTORIES)

#WINDOWS   del src\*.o
#          del res\*.o
#          del app.exe

#LINUX     rm -f src/*.o
#          rm -f res/*.o
#          rm -f app.out

clean:
	del src\*.o
	del res\*.o
	del app.exe
