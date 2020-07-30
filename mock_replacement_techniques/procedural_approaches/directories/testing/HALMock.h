#pragma once

class HAL {
public:
    MOCK_METHOD(GPIO_PinState, GPIO_ReadPin, (GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin));
    MOCK_METHOD(void, GPIO_WritePin, (GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState));
};
