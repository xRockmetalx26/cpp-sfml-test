CPP_FILES       := $(wildcard src/*.cpp)
RC_FILES        := $(wildcard res/*.rc)
O_FILES         := $(subst .cpp,.o,$(CPP_FILES)) $(subst .rc,.o,$(RC_FILES))
COMPILED_FLAGS  := -pedantic -W -Wall -O3
LINKED_FLAGS    := -s

# -I"your-directory" add include directory (files .h) (HEADERS)
INCLUDE_DIRECTORIES  := -Iinclude

# -L"your-directory" add lib directory (files .a .dll) (LIBRARIES)
LIB_DIRECTORIES      := -Llib

# -l"filename without lib prefix and .a extension" add libraries to use (libfile.a / libfile.dll)
LIB_FILES            := -lopenal32 -lsfml-system -lsfml-graphics -lsfml-window

app: $(O_FILES)
	g++ $^ -o $@ $(LIB_DIRECTORIES) $(LIB_FILES) $(LINKED_FLAGS)

%.o: %.cpp
	g++ -c $^ -o $@ $(INCLUDE_DIRECTORIES) $(COMPILED_FLAGS)

%.o: %.rc
	windres $^ -o $@ $(INCLUDE_DIRECTORIES)

clean:
	del *.o *.exe /s