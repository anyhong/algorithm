/// https://leetcode-cn.com/problems/two-sum/

class Solution {
    
    /// 解法一
    /// 暴力解法，双重循环
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (currentIndex, currentNum) in nums.enumerated() {
//            print("currentIndex:" + "\(currentIndex)")
            for remainderIndex in currentIndex ..< nums.count {
//                print("remainderIndex:" + "\(remainderIndex)")
                if (currentNum + nums[remainderIndex] == target) && (currentIndex != remainderIndex) {
                    return[currentIndex, remainderIndex];
                }
            }
        }
        return []
    }
    
    /// 解法二
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        for (currentIndex, currentNum) in nums.enumerated() {
            let remainderNum = target - currentNum;
            if let remainderIndex = nums.firstIndex(of: remainderNum) {
                if remainderIndex != currentIndex {
                    return [currentIndex, remainderIndex]
                }
            }
        }
        return []
    }
    
    /// 解法三
    /// hash表
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int : Int] = [:]
        for (index, num) in nums.enumerated() {
//            print("index:\(index) num:\(num)")
            let remainderNum = target - num
            if (dic.keys.contains(remainderNum)) {
                if let remainderIndex = dic[remainderNum], remainderIndex != index {
                    return [remainderIndex, index]
                }
            }
            dic[num] = index
//            print(dic)
        }
        return []
    }
    
    /// 解法四
    /// 二分查询
    func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
        let numbers = nums.sorted()
        var left = 0
        var right = numbers.count - 1
        
        var result: [Int] = []
        
        while left < right {
            let leftNum = numbers[left]
            let rightNum = numbers[right]
            
            let sum = leftNum + rightNum
            if sum == target {
                result = [nums.firstIndex(of: leftNum)!, nums.firstIndex(of: rightNum)!]
                break
            } else if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            }
        }
        
        return result
    }
}

print(Solution().twoSum([1, 2, 3], 4))
print(Solution().twoSum([2, 7, 11, 15], 26))

print(Solution().twoSum1([1, 2, 3], 4))
print(Solution().twoSum1([2, 7, 11, 15], 26))

print(Solution().twoSum2([1, 2, 3], 4))
print(Solution().twoSum2([2, 7, 11, 15], 26))

print(Solution().twoSum3([1, 2, 3], 4))
print(Solution().twoSum3([2, 7, 11, 15], 26))

//import Foundation
//import XCTest
//
//class GTest: XCTestCase {
//    override class func setUp() {
//        super.setUp()
//    }
//
//    override class func tearDown() {
//        super.tearDown()
//    }
//
//
//    func testTwoSum() {
//        XCTAssertEqual(Solution().twoSum([1, 2, 3], 4), [0, 2])
//        XCTAssertEqual(Solution().twoSum([2, 7, 11, 15], 26), [2, 3])
//    }
//}
//
//GTest.defaultTestSuite.run()

