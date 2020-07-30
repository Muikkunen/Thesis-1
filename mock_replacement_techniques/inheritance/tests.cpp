#include <gtest/gtest.h>
#include <gmock/gmock.h>

#include "main.h"
#include "HALMock.h"
#include "Led.h"

TEST(LedTest, CheckLedState) {
	HALMock hal;
	Led led(LED1_GPIO_Port, LED1_Pin, hal);
    	EXPECT_CALL(hal, GPIO_ReadPin(LED1_GPIO_Port, LED1_Pin))
		.WillOnce(testing::Return(GPIO_PIN_RESET))
		.WillOnce(testing::Return(GPIO_PIN_SET));
	EXPECT_EQ(led.checkState(), false);
	EXPECT_EQ(led.checkState(), true);
}

TEST(LedTest, TurnLedOn) {
	HALMock hal;
	Led led(LED1_GPIO_Port, LED1_Pin, hal);
	EXPECT_CALL(hal, GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET));
	led.turnOn();
}
