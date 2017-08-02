/*: 
 # Romans is a programming excercise in a Swift Playground
 
 The problem is converting between [roman numerals](https://en.wikipedia.org/wiki/Roman_numerals) & western arabic numbers.
 
 Your challenge is to implement two functions
 1. romanToNum which takes Roman numbers as Strings and returns their numeric value
 2. numToRoman which takes a regular number and returns a roman one as a String

 We have provided a few tests which pass by chance and one that doesnt
 
 - Note:
 Written in the year MMXVI,
 revised in the year MMXVII
 */
import Foundation

enum RomanCharacter: String
{
    case I
    case IV
    case V
    case IX
    case X
    case XL
    case L
    case XC
    case C
    case CM
    case M

    func value() -> Int
    {
        switch self
        {
            case .I:  return 1
            case .IV: return 4
            case .V:  return 5
            case .IX: return 9
            case .X:  return 10
            case .XL: return 40
            case .L:  return 50
            case .XC: return 90
            case .C:  return 100
            case .CM: return 900
            case .M: return 1000
        }
    }

    static func all() -> [RomanCharacter]
    {
        return [.M, .CM, .C, .XC, .L, .XL, .X, .IX, .V, .IV, .I]
    }
}

// implement me!
func romanToNum(romanNumber: String) -> Int
{
    for possibleValue in RomanCharacter.all()
    {
        if romanNumber.starts(with: possibleValue.rawValue)
        {
            let characterSize = possibleValue.rawValue.characters.count
            let substring     = String(romanNumber.dropFirst(characterSize))
            return possibleValue.value() + romanToNum(romanNumber: substring)
        }
    }

    if !romanNumber.isEmpty
    { print ("Could not recognise character \(romanNumber.first!)") }

    return 0
}

// implement me too!
func numToRoman(number: Int) -> String
{
    for entry in RomanCharacter.all()
    {
        let value = entry.value()
        if number - value >= 0
        {
            return entry.rawValue + numToRoman(number: number - value)
        }
    }
    return ""
}

let III = "III"
let three = 3
assert(romanToNum(romanNumber: III) == three, "the number III is 3")
assert(numToRoman(number: three) == III, "the number 3 is III")
// associative?? commutative??
assert(romanToNum(romanNumber: numToRoman(number: three)) == three, "3 -> III -> 3")
assert(numToRoman(number: romanToNum(romanNumber: III)) == III, "III -> 3 -> III")

let IV = "IV"
assert(romanToNum(romanNumber: IV) == 4, "IV should be four")

let XLII = "XLII"
let XLIV = "XLIV"
assert(romanToNum(romanNumber: XLII) == 42, "Should be the answer")
assert(romanToNum(romanNumber: XLIV) == 44, "Should be the answer + 2")

print (numToRoman(number: 99))
print(romanToNum(romanNumber: "MCMXC"))




