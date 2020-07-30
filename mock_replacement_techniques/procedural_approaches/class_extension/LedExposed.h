#ifdef UNITTEST
#include "HALMock.h"
#else
#include "HAL.h"
#endif

#include "Led.h"

class LedExposed : public Led {
public:
	LedExposed(GPIO_TypeDef* io_port, uint16_t io_pin) : Led(io_port, io_pin) {}
	
	HAL& getHAL() {
		return hal;
	};
};
