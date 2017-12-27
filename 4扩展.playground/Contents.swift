//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//扩展就是向一个已有的类、结构体或枚举类型添加新功能。
//扩展可以对一个类型添加新的功能，但是不能重写已有的功能
//swift中的扩展可以：
//1.添加计算型属性和计算型静态属性
//2.定义实例方法和类方法
//3.提供新的构造器
//4.定义下标
//5.定义和使用新的嵌套类型
//6.使用一个已有类型符合某个协议

//语法
//extension SomeType {
//
//}

//一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，
//extension SomeType: SomeProtocol, AnotherProctocol {
//
//}


// MARK: - 扩展可以向已有类型添加计算型实例型属性和计算型类型属性。


// MARK: - 计算型实例属性
extension Int {
    var add: Int {return self + 100}
    var sub: Int {return self - 10}
    var mul: Int {return self*10}
    var div: Int {return self/5}
    
    
}
let add = 3.add
print(add)


/// 扩展可以向已有类型添加新的构造器---这可以让你扩展其他类型，将你自己的定制类型作为构造参数，或者提供该类型的原始实现中没有包含的额外初始化选项扩展可以向类中添加新的便利构造器init()，但是他们不能向勒种添加新的指定构造器或析构函数deinit()
struct sum {
    var num = 100, num2 = 200
    
}

struct diff {
    var no1 = 200, no2 = 100
    
}
struct mult {
    var a = sum()
    var b = diff()
}
extension mult {
    init(x:sum, y:diff) {
        _=x.num+x.num2
        _=y.no1+y.no2
    }
}

let a = sum.init(num: 100, num2: 200)
let b = diff.init(no1: 200, no2: 100)

let getMult = mult.init(x: a, y: b)
print(getMult)

print("getMult sum\(getMult.a.num, getMult.a.num2)")
print("getMult diff\(getMult.b.no1, getMult.b.no2)")


// MARK: - 扩展可以向已有类型添加新的实例方法和类型方法。下面的例子向Int类型添加一个名为 topics 的新实例方法：
extension Int {
    func topics(summaytion: ()->()) {
        for _ in 0..<self {
            summaytion()
        }
    }
}

3.topics {
    print("扩展模块内")
}


// MARK: - 扩展可以向已有的类、结构体和枚举添加新的嵌套类型：
extension Int {
    enum calc
    {
        case add
        case sub
        case mult
        case div
        case anything
    }
    
    
    
    var print: calc {
        switch self
        {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mult
        case 3:
            return .div
        default:
            return .anything
        }
    }
}

func result(numb: [Int]) {
    for i in numb {
        switch i.print {
        case .add:
            print(" 10 ")
            fallthrough
        case .sub:
            print(" 20 ")
        case .mult:
            print(" 30 ")
        case .div:
            print(" 40 ")
        default:
            print(" 50 ")
            
        }
    }
}

result(numb: [0, 1, 2, 3, 4, 7])
