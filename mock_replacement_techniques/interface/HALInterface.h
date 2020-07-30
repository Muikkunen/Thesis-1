#pragma once

class HALInterface {
public:
	virtual void GPIO_WritePin(GPIO_TypeDef* io_port, uint16_t io_pin, GPIO_PinState pin_state) = 0;
	virtual GPIO_PinState GPIO_ReadPin(GPIO_TypeDef* io_port, uint16_t io_pin) = 0;
};
