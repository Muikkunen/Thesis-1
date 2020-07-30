#include "HALInterface.h"

class HAL : public HALInterface {
public:
	void GPIO_WritePin(GPIO_TypeDef* io_port, uint16_t io_pin, GPIO_PinState pin_state) {
		HAL_GPIO_WritePin(io_port, io_pin, pin_state);
	}

	GPIO_PinState GPIO_ReadPin(GPIO_TypeDef* io_port, uint16_t io_pin) {
		return HAL_GPIO_ReadPin(io_port, io_pin);
	}
};
