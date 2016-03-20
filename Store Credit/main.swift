//
//  main.swift
//  Store Credit
//
//  Created by Robert Nasuti on 3/19/16.
//  Copyright © 2016 Robert Nasuti. All rights reserved.
//

import Foundation

let readFile = "A-large-practice.in" //this is the file. we will write to and read from it

var credit = Array<Int>()
var prices = Array<Array<Int>>()

func determineAnswerString(creditIndex:Int) -> String
{
    for var indexOfItem1 = 0; indexOfItem1 < prices[creditIndex].count; indexOfItem1++ {
        for var indexOfItem2 = 0; indexOfItem2 < prices[creditIndex].count; indexOfItem2++ {
            if (indexOfItem1 == indexOfItem2) {
                break
            }
            else if (prices[creditIndex][indexOfItem1] + prices[creditIndex][indexOfItem2] == credit[creditIndex])
            {
                if (indexOfItem1 < indexOfItem2) {
                    return("Case #\(creditIndex+1): \(indexOfItem1 + 1) \(indexOfItem2 + 1)")
                }
                else {
                    return("Case #\(creditIndex+1): \(indexOfItem2 + 1) \(indexOfItem1 + 1)")
                }
            }
        }
    }
    
    return "Did not find a match"
}

if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
    let readPath = dir.stringByAppendingPathComponent(readFile);
    
    do {
        let text2 = try NSString(contentsOfFile: readPath, encoding: NSUTF8StringEncoding)
        //print("\(text2)")
    
        var input = text2.componentsSeparatedByString("\n")
    
        for var i=0; i < Int(input[0]); i++
        {
            credit.append(Int(input[(i*3)+1])!)
            prices.append([Int]())
            
            for var j=0; j < Int(input[(i*3) + 2]); j++
            {
                var priceArray = input[(i*3) + 3].componentsSeparatedByString(" ")
                prices[i].append(Int(priceArray[j])!)
            }
        }

        for var i = 0; i < credit.count; i++ {
            var answer = determineAnswerString(i)
            print(answer)
        }
    }
    catch {
        print("Reading the text file didn't work.")}
}




