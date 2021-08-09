/// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character : Int]()
        var start = 0
        var result = 0
        
        for (index, item) in s.enumerated() {
            let previousIndex = dic[item] ?? -1
            if previousIndex >= start {
                start = previousIndex + 1
            }
            let currentLength = index - start + 1
            result = max(result, currentLength)
            dic[item] = index
            print(dic)
        }
        return result
    }
}

var s: String = "abcabcbb"
print(Solution().lengthOfLongestSubstring(s))
print(Solution().lengthOfLongestSubstring("aabbc"))
print(Solution().lengthOfLongestSubstring("1234124444"))
