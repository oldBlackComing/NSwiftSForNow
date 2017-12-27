//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*Swift 提供了泛型让你写出灵活且可重用的函数和类型。Swift标准库是通过泛型代码构建出来的。Swift的数组和字典类型都是泛型集。你可以传建一个Int数组，也可以创建一个String数组，或者甚至于可以是任何其他Swift的类型数据数组。以下实例是一个非泛型函数exchange用来交换两个Int值*/
func swapTowInts(_ a:inout Int, _ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 10
var b = 20

print("交换前的数据\(a,b)")
swap(&a, &b)
print("交换后的数据\(a,b)")

/*以上实例只适用于交换整数Int类型的变量*/
/*泛型使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、Stirng或Double）。*/
func swapTowValues<T>(_ a:inout T, _ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

/*泛型类型*/
/*Swift 润徐你定义你自己的泛型类型。自定义类、结构体和美剧作用于任何类型，如同 Array 和 Dictionary 的用法接下来我们来编写一个名为Stack（栈）的泛型集合类型，栈只允许在集合的末端添加新的元素（称之为入栈），且也只能从末端移除元素（称之为出栈）*/

/*Int 非反省版本的栈 型的栈*/
struct IntStack {
    var items = [Int]()
    mutating func push (_ item: Int){
        items.append(item)
    }
    mutating func pop ()->Int{
        return items.removeLast()
    }
    
    
    
}
/*提供了两个方法：push 、 和 pop 用来向栈中亚茹值以及从栈中移除值。这些方法被标记为 mutating， 因为他们需要修改结构体的items数组*/
struct Stack<Element>{
    var items = [Element]()
    mutating func push (_ item: Element){
        items.append(item)
    }
    mutating func pop()->Element{
        return items.removeLast()
    }
    
}

var stackOfStrings = Stack<String>()
print("字符串元素入栈: ")
stackOfStrings.push("google")
stackOfStrings.push("runoob")
print(stackOfStrings.items)

let deletetos = stackOfStrings.pop()
print("出栈元素: " + deletetos)

//Stack 基本上和 IntStack 相同，占位类型参数 Element 代替了实际的 Int 类型。
//
//以上实例中 Element 在如下三个地方被用作占位符：
//
//创建 items 属性，使用 Element 类型的空数组对其进行初始化。
//指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
//指定 pop() 方法的返回值类型必须是 Element 类型。

/*扩展泛型类型 当你要扩展一个泛型类型的时候（使用 extension 关键字）， 你并不需要在扩展的定义中提供类型参数表。更加方便的是，原始类型定义中生命的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。下面的雷子扩展了泛型类型Stack，为期添加了一个名为topItem的只读计算属性，他将会返回当前栈顶端的元素而不将其从栈中移除*/
extension Stack {
    var topItem1: Element? {
        get{
        return items.isEmpty ? nil : items[items.count - 1]
        }
//        set{
//            topItem1 = newValue
//        }
    }
    mutating func topItem()->Element?{
        if items.count > 0 {
            return items[0]
        }else{
            return nil
        }
    }
}


//stackOfStrings.topItem1 = "string"
if let topItem = stackOfStrings.topItem() {
    print("栈中的顶部元素是：\(topItem).")
}else{
    print("no top")
}

print(stackOfStrings.items)

/*我们也可以通过扩展一个存在的类型来指定关联类型。例如Swift的Array类型已经提供append（）方法 一个count 属性，以及一个接受Int 类型索引值得下标用以检索其他元素。这三个功能都符合Container协议的要求，所以你只需简单地生命Array采纳该协议就可以扩展Array 以下实例创建一个空扩展即可：*/

extension Array{
    var halfCount: Int {
        return self.count/2
    }
}

print(stackOfStrings.items.count,stackOfStrings.items.halfCount)


class aaa{
    
}

class bbb{
    
}

class ccc: aaa{
    
}
/*类型约束*/
/*类型约束指定了一个必须继承自指定类得类型参数，或者遵循一个特定的协议或者遵循一个特定的协议或协议构成*/
/*类型约束语法你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分。这种作用于泛型函数的类型约束的基础语法如下所示（和泛型类型的语法相同）：*/
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//    // 这里是泛型函数的函数体部分
//}
func someFunction<T: aaa, U: bbb>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}

func someFouncting(T: aaa, someU: bbb){
    
}

let aaaa = aaa()
let bbbb = bbb()
let cccc = ccc()

someFouncting(T: cccc, someU: bbbb)

someFunction(someT: cccc, someU: bbbb)

/*关联类
 Swift 中使用 associatedtype 关键字来设置关联类型实例。
 
 下面例子定义了一个 Container 协议，该协议定义了一个关联类型 ItemType。
 
 Container 协议只指定了三个任何遵从 Container 协议的类型必须提供的功能。遵从协议的类型在满足这三个条件的情况下也可以提供其他额外的功能。*/

// Container 协议
protocol Container {
    associatedtype ItemType
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
    // 获取容器中元素的数
    var count: Int { get }
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType { get }
}

// Stack 结构体遵从 Container 协议
struct Stackaaa<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
var tos = Stackaaa<String>()
tos.push("google")
tos.push("runoob")
tos.push("taobao")
// 元素列表
print(tos.items)
// 元素个数
print( tos.count)


/*Where 语句
 类型约束能够确保类型符合泛型函数或类的定义约束。
 
 你可以在参数列表中通过where语句定义参数的约束。
 
 你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。
 
 实例
 下面的例子定义了一个名为allItemsMatch的泛型函数，用来检查两个Container实例是否包含相同顺序的相同元素。
 
 如果所有的元素能够匹配，那么返回 true，反之则返回 false。*/
// 扩展，将 Array 当作 Container 来使用

// Container1 协议
protocol Container1 {
    associatedtype ItemType
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
    // 获取容器中元素的数
    var count: Int { get }
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType { get }
}

// // 遵循Container1协议的泛型TOS类型
struct Stack1<Element>: Container1 {
    // Stack1<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container1 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container1 {}

func allItemsMatch<C1: Container1, C2: Container1>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // 所有元素都匹配，返回 true
        return true
}
var tos1 = Stack1<String>()
tos1.push("google")
tos1.push("runoob")
tos1.push("taobao")

var aos1 = ["google", "runoob", "taobao"]

if allItemsMatch(tos1, aos1) {
    print("匹配所有元素")
} else {
    print("元素不匹配")
}

extension Array: Container {}
