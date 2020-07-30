#include <gtest/gtest.h>
#include <gmock/gmock.h>

#include "main.h"
#include "LedExposed.h"

TEST(LedTest, CheckLedState) {
	LedExposed led(LED1_GPIO_Port, LED1_Pin);
    	EXPECT_CALL(led.getHAL(), GPIO_ReadPin(LED1_GPIO_Port, LED1_Pin))
		.WillOnce(testing::Return(GPIO_PIN_RESET))
		.WillOnce(testing::Return(GPIO_PIN_SET));
	EXPECT_EQ(led.checkState(), false);
	EXPECT_EQ(led.checkState(), true);
}

TEST(LedTest, TurnLedOn) {
	LedExposed led(LED1_GPIO_Port, LED1_Pin);
	EXPECT_CALL(led.getHAL(), GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET));
	led.turnOn();
}

