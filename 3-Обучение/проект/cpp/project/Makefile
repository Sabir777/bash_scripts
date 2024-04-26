# Указываю путь относительно папки debug или release
source_dirs := ../../src
# Это нужно делать потому что в make_debug.sh
# я устанавливаю текущей директорией папку debug (release) через ключ --directory
# Поэтому все пути определяются относительно этой папки


search_pattern := $(addsuffix /*.cpp,$(source_dirs)) 
override compile_flags += -pipe

file.out: $(notdir $(patsubst %.cpp,%.o,$(wildcard $(search_pattern))))
		g++ $^ -o $@ 

VPATH := $(source_dirs)
 
%.o: %.cpp
		g++ -c -MD $(addprefix -I,$(source_dirs)) $(compile_flags) $<

include $(wildcard *.d)

