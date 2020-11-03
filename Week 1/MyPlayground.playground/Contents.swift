import UIKit
import Foundation

//Exercise 1
for i in 1...20{
    print(i);
}

//Exercise 2
for i in 1...20{
    if i % 2 != 0{
        print(i)
    }
}

//Exercise 3
var total = 0;
for i in 1...20{
    if i % 2 != 0{
        total += i;
    }
}

print(total)


//Exercise 4
func result(mark: Int)->String{
    if mark < 50{
        return "Fail"
    }else{
        return "True"
    }
}

//Exercise 5
func findMax(n: [Int])->Int{
    var highval = 0;
    
    for i in n{
        if(highval < i)
        {
            highval = i;
        }
    }
    return highval;
    
}

var listofNumbers = [Int]();

for _ in 1...10{
    let x = Int(arc4random_uniform(100));
    listofNumbers.append(x);
}

print(findMax(n: listofNumbers))

//Exercise 6
func findMin(n: [Int])->Int{
    var lowval = 0;
    
    for i in n{
        if(lowval < i)
        {
            lowval = i;
        }
    }
    return lowval;
    
}

print(findMin(n: listofNumbers))

//Exercise 7
func calAverage(n: [Int])->Int{
    total = 0;
    for i in n{
        total += i;
    }
    
    return total / n.count;
}

print(calAverage(n: listofNumbers))
