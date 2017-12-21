//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift 泛型
//Swift 提供了泛型让你写出灵活且可重用的函数和类型。
//
//Swift 标准库是通过泛型代码构建出来的。
//
//Swift 的数组和字典类型都是泛型集。
//
//你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。
//
//以下实例是一个非泛型函数 exchange 用来交换两个 Int 值：
// 定义一个交换两个变量的函数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var numb1 = 100
var numb2 = 200

print("交换前数据: \(numb1) 和 \(numb2)")
swapTwoInts(&numb1, &numb2)
print("交换后数据: \(numb1) 和 \(numb2)")


//swapTwoValues 后面跟着占位类型名（T），并用尖括号括起来（<T>）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T 的实际类型。
//
//以下实例是一个泛型函数 exchange 用来交换两个 Int 和 String 值：
// 定义一个交换两个变量的函数
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}


print("交换前数据:  \(numb1) 和 \(numb2)")
swapTwoValues(&numb1, &numb2)
print("交换后数据: \(numb1) 和 \(numb2)")

var str1 = "A"
var str2 = "B"

print("交换前数据:  \(str1) 和 \(str2)")
swapTwoValues(&str1, &str2)
print("交换后数据: \(str1) 和 \(str2)")
