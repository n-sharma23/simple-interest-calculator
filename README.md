# Simple Interest Calculator

A simple interest calculator works out the interest earned or owed on a principal amount at a fixed rate over a period of time. Interest is charged only on the original principal, never on interest already accrued.

## Formula

```
SI = (P × R × T) / 100
```

| Symbol | Meaning | Example |
|---|---|---|
| `P` | Principal: the amount borrowed or invested | 10,000 |
| `R` | Annual rate of interest, in percent | 5 |
| `T` | Time, in years | 3 |
| `SI` | Simple interest | 1,500 |

Total amount at the end of the period:

```
A = P + SI
```

## Worked example

With a principal of 10,000, a rate of 5% per year and a period of 3 years:

```
SI = (10000 × 5 × 3) / 100 = 1500
A  = 10000 + 1500          = 11500
```

## Inputs and validation

- **Principal** must be a number greater than 0.
- **Rate** must be a number of 0 or more, given as a yearly percentage.
- **Time** must be a number greater than 0, given in years. For months, divide by 12 (6 months = 0.5 years).

## Bash script

`simple-interest.sh` asks for the principal, the annual rate of interest and the time period, then prints the simple interest and the total amount.

```bash
chmod +x simple-interest.sh
./simple-interest.sh
```

## Sample implementation (Python)

```python
def simple_interest(principal: float, rate: float, time: float) -> float:
    if principal <= 0 or rate < 0 or time <= 0:
        raise ValueError("principal and time must be > 0, rate must be >= 0")
    return principal * rate * time / 100


if __name__ == "__main__":
    p = float(input("Principal: "))
    r = float(input("Annual rate (%): "))
    t = float(input("Time (years): "))
    si = simple_interest(p, r, t)
    print(f"Simple interest: {si:.2f}")
    print(f"Total amount:    {p + si:.2f}")
```

Run it with:

```bash
python simple_interest.py
```

## Simple vs compound interest

Simple interest grows linearly because it is always calculated on the original principal. Compound interest is calculated on the principal plus accumulated interest, so it grows faster over time.
