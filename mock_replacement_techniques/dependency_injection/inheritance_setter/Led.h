class Led {
public:
	Led(GPIO_TypeDef* io_port, uint16_t io_pin) :
		port(io_port),
        	pin(io_pin)
        	{};

	void setHAL(HAL *h) {
		hal = h;	
	}
	
	void turnOn() {
		hal->GPIO_WritePin(port, pin, GPIO_PIN_SET);
	};

	bool checkState() {
		return hal->GPIO_ReadPin(port, pin);
	};

private:
	GPIO_TypeDef* port;
	uint16_t pin;
	HAL *hal;
};