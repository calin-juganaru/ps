#include <avr/io.h>
#include <avr/interrupt.h>

constexpr auto SAMPLES    = 1 << 8;
constexpr auto SIZE       = SAMPLES * 2;
constexpr auto SIN_FREQ   = 200;
constexpr auto CLOCK_FREQ = 16000000;
constexpr auto PERIOD     = CLOCK_FREQ / SIN_FREQ / SIZE;

auto sine = new int[SIZE];

void setup()
{
    TCCR1A = 0b10100010;
    TCCR1B = 0b00011001;
    TIMSK1 = 0b00000001;
    ICR1   = PERIOD;
    sei();
    DDRB = 0b00000110;
    pinMode(13, OUTPUT);

    for (auto i = 0; i < SIZE; ++i)
        sine[i] = 0;

    for (auto i = 0; i <= SAMPLES; ++i)
        sine[i] = 0.5 + sin(M_PI * i / SAMPLES) * PERIOD;
}

void loop() {}

ISR(TIMER1_OVF_vect)
{
    static auto index = 0;
    static auto trigger = 0;

    OCR1A = sine[index];
    OCR1B = sine[SIZE - index - 1];

    if (++index >= SIZE)
    {
       index = 0;
       trigger ^= 1;
       digitalWrite(13, trigger);
    }
}
