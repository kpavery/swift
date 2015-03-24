import Cocoa

func makeArray(size:Int) -> [Int] {
	var array:[Int] = []
	for _ in 0..<size {
		array.append(Int(arc4random_uniform(UInt32.max)))
	}
	return array
}

func checkArray(array:[Int]) -> Bool {
	for index in 1..<array.count {
		if array[index-1] > array[index] {
			return false
		}
	}
	return true
}

func selectionSort(inout array:[Int]) {
	for beginIndex in 0..<array.count {
		var (minIndex, min) = (beginIndex, array[beginIndex])
		for checkIndex in beginIndex..<array.count {
			if array[checkIndex] < min {
				(min, minIndex) = (array[checkIndex], checkIndex)
			}
		}
		swap(&array[beginIndex], &array[minIndex])
	}
}

func insertionSort(inout array:[Int]) {
	for beginIndex in 0..<array.count {
		var swapIndex = beginIndex
		while (swapIndex > 0) && (array[swapIndex-1] > array[swapIndex]) {
			swap(&array[swapIndex-1],&array[swapIndex])
			--swapIndex
		}
	}
}

func mergeSort(inout array:[Int]) {
	array = mergeSortSlice(array)
}

func mergeSortSlice(array:[Int]) -> [Int] {
	if (array.count < 2) {
		return array
	}
	var sorted:[Int] = []
	
	var half:Int = Int(array.count / 2)
	var first = mergeSortSlice(Array(array[0..<half]))
	var second = mergeSortSlice(Array(array[half..<array.count]))
	
	var (firstIndex, secondIndex) = (0, 0)
	while (firstIndex < first.count || secondIndex < second.count) {
		if !(firstIndex < first.count) {
			sorted.append(second[secondIndex++])
		} else if !(secondIndex < second.count) {
			sorted.append(first[firstIndex++])
		} else if (first[firstIndex] < second[secondIndex]) {
			sorted.append(first[firstIndex++])
		} else {
			sorted.append(second[secondIndex++])
		}
	}
	return sorted
}

var array:[Int]
var startTime:Double

let size = 100000

array = makeArray(size)
startTime = CFAbsoluteTimeGetCurrent()
selectionSort(&array)
println("Selection Elapsed: \(CFAbsoluteTimeGetCurrent() - startTime); Sorted: \(checkArray(array))")

array = makeArray(size)
startTime = CFAbsoluteTimeGetCurrent()
insertionSort(&array)
println("Insertion Elapsed: \(CFAbsoluteTimeGetCurrent() - startTime); Sorted: \(checkArray(array))")

array = makeArray(size)
startTime = CFAbsoluteTimeGetCurrent()
mergeSort(&array)
println("    Merge Elapsed: \(CFAbsoluteTimeGetCurrent() - startTime); Sorted: \(checkArray(array))")
