import Foundation

// Payment Function
func Payment(loanAmount: Int, numberOfPayments: Int, interestRatePercent: Float) -> Float {
    let P = Float(loanAmount)
    let n = Float(numberOfPayments)
    let r = interestRatePercent / 100.0
    
    // avoid divide by zero error
    if r == 0 {
        return P / n
    } else {
        let numerator = P * r * pow(1 + r, n)
        let denominator = pow(1 + r, n) - 1
        return numerator / denominator
    }
}

// Scenario 1: 2-month loan of $20,000, 4.4% APR, compounded monthly
let loanAmount1 = 20000
let numberOfPayments1 = 2
let annualInterestRate1: Float = 4.4
let monthlyInterestRate1 = annualInterestRate1 / 12.0 // 0.3666667%

let payment1 = Payment(
    loanAmount: loanAmount1,
    numberOfPayments: numberOfPayments1,
    interestRatePercent: monthlyInterestRate1
)

print(String(format: "Scenario 1 Payment: $%.2f per month", payment1))

// Scenario 2: 30-year loan of $150,000, 5% APR, one annual payment each year for 30 years
let loanAmount2 = 150000
let numberOfPayments2 = 30
let annualInterestRate2: Float = 5.0 // Since payments are annual, use APR as is

let payment2 = Payment(
    loanAmount: loanAmount2,
    numberOfPayments: numberOfPayments2,
    interestRatePercent: annualInterestRate2
)

print(String(format: "Scenario 2 Payment: $%.2f per year", payment2))
