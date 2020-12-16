constexpr auto PREC = 10;
constexpr auto MAX_VALUE = 1 << PREC - 1;
constexpr auto HALF = MAX_VALUE / 2;
constexpr auto pi = 3.14159265356;

auto sine = new int[MAX_VALUE];
auto index = 0;

void setup()
{
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(A0, OUTPUT);
    pinMode(A1, OUTPUT);

    analogWriteResolution(PREC);

    auto aux = 2.0 * pi / MAX_VALUE;
    for (auto i = 0; i < MAX_VALUE; ++i)
        sine[i] = (1.0 + sin(aux * i)) * (HALF - 1);
}

void loop() 
{
    analogWrite(A0, sine[index]);
    analogWrite(A1, sine[index]);
    index = (index + 1) % MAX_VALUE;
}
