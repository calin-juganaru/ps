// ================================================================================

#undef abs

constexpr auto LINES     = 22;
constexpr auto SIZE      = LINES * 6;
constexpr auto pi        = 3.14159265356;
constexpr auto PREC      = 12;
constexpr auto MAX_VALUE = (1 << PREC) - 1;
constexpr auto HALF      = MAX_VALUE / 2;

using type = float;

// ================================================================================

struct complex
{
    type real, imag;

    complex(type _real):
        real(_real), imag() {}

    complex(type _real, type _imag):
        real(_real), imag(_imag) {}

    complex operator*(const complex& other)
    {
        auto x = this->real * other.real
               - this->imag * other.imag;
        auto y = this->real * other.imag
               - this->imag * other.real;
        return complex(x, y);
    }

    complex& operator+=(const complex& other)
    {
        this->real += other.real;
        this->imag += other.imag;
        return *this;
    }

    complex() = default;
    complex(complex&&) = default;
    complex& operator=(const complex&) = default;
    complex(const complex&) = default;
    ~complex() = default;

    type abs() { return sqrt(real * real + imag * imag); }

    static auto exp(type phi) { return complex(cos(phi), sin(phi)); }
};

// ================================================================================

type signal[SIZE];
complex coefs[SIZE];
int sine[MAX_VALUE];
auto element = 0;

// ================================================================================

auto dft()
{
    for (auto k = 0; k < SIZE; ++k)
    {
        coefs[k] = complex(0);
        for (auto n = 0; n < SIZE; ++n)
            coefs[k] += complex(signal[n])
                      * complex::exp(-2 * pi * k * n / SIZE);
    }
}

// ================================================================================

auto idft()
{
    for (auto k = 0; k < SIZE; ++k)
    {
        auto aux = complex(0);
        for (auto n = 0; n < SIZE; ++n)
            aux += complex(coefs[n])
                 * complex::exp(2 * pi * k * n / SIZE);
        signal[k] = aux.real / SIZE;
    }
}

// ================================================================================

auto high_pass_filter()
{
    auto highest = type();

    for (auto i = 0; i < SIZE; ++i)
        highest = max(highest, coefs[i].abs());

    highest /= 2;

    for (auto i = 0; i < SIZE; ++i)
        if (coefs[i].abs() < highest)
            coefs[i] = 0;
}

// ===============================================================================

auto normalise(type peak)
{
    auto minim = peak, maxim = type();

    for (auto i = 0; i < SIZE; ++i)
    {
        minim = min(minim, signal[i]);
        maxim = max(maxim, signal[i]);
    }

    if (minim < 0)
        minim = -minim;
    maxim += minim;

    for (auto i = 0; i < SIZE; ++i)
    {
        signal[i] += minim;
        signal[i] /= maxim;
        signal[i] *= peak;
    }
}

// ===============================================================================

void setup()
{
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(A0, OUTPUT);
    pinMode(A1, INPUT);

    Serial.begin(230400);
    Serial.print("sine = ... \n");
    Serial.print("[   ... \n    ");

    analogWriteResolution(PREC);

    auto aux = 2.0 * pi / MAX_VALUE;
    for (auto i = 0; i < MAX_VALUE; ++i)
        sine[i] = (1.0 + sin(aux * i)) * (HALF - 1);

    while (true)
    {
        analogWrite(A0, sine[element]);
        element = (element + 1) % MAX_VALUE;
    }
}

// ================================================================================

void loop()
{
    static auto count = 0;

    if (count < SIZE)
    {
        signal[count] = analogRead(A1);
        Serial.print(signal[count++]);
        Serial.print(" ");

        if (count % LINES == 0)
            Serial.print(" ... \n    ");
    }
    else
    {
        Serial.print("...\n];\n\n");
        dft();
        high_pass_filter();
        idft();
        normalise(MAX_VALUE - 1);

        Serial.print("result = ... \n");
        Serial.print("[   ... \n    ");
        for (auto i = 0; i < SIZE; ++i)
        {
            Serial.print(signal[i]);
            Serial.print(" ");

            if (i % LINES == LINES - 1)
                Serial.print(" ... \n    ");
        }
        Serial.print("...\n]; \n");

        while (true)
        {
            analogWrite(A0, signal[element]);
            element = (element + 1) % SIZE;
        }
    }
}

// ===============================================================================