.PHONY: compile clean

CFLAGS=-Wfatal-errors -Iinclude -Iinclude/STM32F7xx_HAL_Driver/Inc -Iinclude/STM32F7xx_HAL_Driver/Inc/Legacy -Iinclude/STM32F7xx_HAL_Driver/Src -Iinclude/CMSIS/Include -Iinclude/CMSIS/Device/ST/STM32F7xx/Include -DSTM32F767xx -fpermissive
LFLAGS=-Llibraries -lgtest -lgtest_main -lgmock -pthread

MACRO_PREPROCESSED=macro_preprocessed_tests
LINK-TIME=link-time_tests
INTERFACE=interface_tests
INHERITANCE=inheritance_tests

TECHNIQUES=mock_replacement_techniques
DEPENDENCY_INJECTION=$(TECHNIQUES)/dependency_injection
PROCEDURAL=$(TECHNIQUES)/procedural_approaches
HAL_GPIO=include/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c

all: macro_preprocessed link-time interface inheritance inheritance_constructor inheritance_setter inheritance_parameter preprocessor_directives directories class_extension

######################################################################

macro_preprocessed: compile_macro_preprocessed
	g++ *.o -o $(MACRO_PREPROCESSED) $(LFLAGS)
	rm -f *.o

compile_macro_preprocessed:
	g++ -c $(TECHNIQUES)/macro_preprocessed/*.cpp $(CFLAGS) -DUNITTEST

######################################################################

link-time: compile_link-time
	g++ *.o -o $(LINK-TIME) $(LFLAGS)
	rm -f *.o

compile_link-time:
	g++ -c $(TECHNIQUES)/link-time/testing/*.cpp $(CFLAGS) -DUNITTEST -I$(TECHNIQUES)/link-time -I$(TECHNIQUES)/link-time/testing


######################################################################

interface: compile_interface
	g++ *.o -o $(INTERFACE) $(LFLAGS)
	rm -f *.o

compile_interface:
	g++ -c $(TECHNIQUES)/interface/*.cpp $(CFLAGS)

######################################################################

inheritance: compile_inheritance
	g++ *.o -o $(INHERITANCE) $(LFLAGS)
	rm -f *.o

compile_inheritance:
	gcc -c include/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_gpio.c $(CFLAGS)
	g++ -c $(TECHNIQUES)/inheritance/*.cpp $(CFLAGS)


######################################################################

constructor: compile__constructor
	g++ *.o -o $(INHERITANCE)_with_constructor $(LFLAGS)
	rm -f *.o

compile_constructor:
	gcc -c $(HAL_GPIO) $(CFLAGS)
	g++ -c $(DEPENDENCY_INJECTION)/inheritance_constructor/*.cpp $(CFLAGS)

######################################################################

setter: compile_setter
	g++ *.o -o $(INHERITANCE)_with_setter $(LFLAGS)
	rm -f *.o

compile_setter:
	gcc -c $(HAL_GPIO) $(CFLAGS)
	g++ -c $(DEPENDENCY_INJECTION)/inheritance_setter/*.cpp $(CFLAGS)

######################################################################

parameter: compile_parameter
	g++ *.o -o $(INHERITANCE)_with_parameter $(LFLAGS)
	rm -f *.o

compile_parameter:
	gcc -c $(HAL_GPIO) $(CFLAGS)
	g++ -c $(DEPENDENCY_INJECTION)/inheritance_parameter/*.cpp $(CFLAGS)

######################################################################

preprocessor_directives: compile_preprocessor_directives
	g++ *.o -o $(MACRO_PREPROCESSED)_with_preprocessor_directives $(LFLAGS)
	rm -f *.o

compile_preprocessor_directives:
	g++ -c $(PROCEDURAL)/preprocessor_directives/*.cpp $(CFLAGS) -DUNITTEST


######################################################################

directories: compile_directories
	g++ *.o -o $(MACRO_PREPROCESSED)_with_directories $(LFLAGS)
	rm -f *.o

compile_directories:
	g++ -c $(PROCEDURAL)/directories/testing/*.cpp $(CFLAGS) -DUNITTEST

######################################################################

class_extension: compile_class_extension
	g++ *.o -o $(MACRO_PREPROCESSED)_with_class_extension $(LFLAGS)
	rm -f *.o

compile_class_extension:
	g++ -c $(PROCEDURAL)/class_extension/*.cpp $(CFLAGS) -DUNITTEST


######################################################################

clean:
	rm -f *.o *_tests*
