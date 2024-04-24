import Foundation

func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
    var k = k
    var w = w

    var new = zip(capital, profits).sorted { $0.0 < $1.0 }

    var i = 0

    let h = MaxHeap<Int>()
    while k > 0 {

        while i < new.count && new[i].0 <= w {
            h.insert(new[i].1)
            i+=1
        }

        guard let max = h.remove() else {
            return w
        }

        k -= 1
        w += max
    }

    return w
}

//print(findMaximizedCapital(10, 0, [1,2,3], [0,1,2]))
