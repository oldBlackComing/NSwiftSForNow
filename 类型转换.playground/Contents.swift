//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift 类型转换可以判断实例的类型。也可用于检测实例类型是否属于欺负类或者子的实例。
//Swift中类型转换使用is和as操作符实现。
//is用于检测值得类型，
//as用于转换类型。
//类型转换也可以用来检查一个类事都实现了某个协议。

class Subjects {
    var physics: String
    init(physics:String) {
        self.physics = physics
    }
    
}

class Chemistry: Subjects {
    var equations: String
    init(physics: String, equations: String) {
        self.equations = equations
        super.init(physics: physics)
        self.physics = physics

    }
}


class Maths: Subjects {
    var formulae: String
    init(physics: String, formulae: String) {
        self.formulae = formulae
        super.init(physics: physics)
    }
}


let sa = [
    Chemistry(physics: "固体物理", equations: "赫兹"),
    Maths(physics: "流体动力学", formulae: "千兆赫")]


let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
print("实例物理学是: \(samplechem.physics)")
print("实例方程式: \(samplechem.equations)")


let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
print("实例物理学是: \(samplemaths.physics)")
print("实例公式是: \(samplemaths.formulae)")

//检查类型
//类型转换用于检测实例类型是否属于特定的实例类型
//你可以将它用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其他类型。类型检查使用is关键字。操作符 is 来检查一个实例是否属于子类型若实例属于哪个子类，类型检查操作符返回true，否则返回false

var chemCount: Int = 0
var mathsCount: Int = 0
for item in sa {
    // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
    if item is Chemistry {
        chemCount += 1
    } else if item is Maths {
        mathsCount += 1
    }
}

print("化学科目包含 \(chemCount) 个主题，数学包含 \(mathsCount) 个主题")

//向下转型
//向下转型，用类型转换操作符(as? 或 as!)
//当你不确定向下转型可以成功时，用类型转换的条件形式(as?)。条件形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil。
//只有你可以确定向下转型一定会成功时，才使用强制形式(as!)。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。


for item in sa {
    // 类型转换的条件形式
    if let show = item as? Chemistry {
        print("化学主题是: '\(show.physics)', \(show.equations)")
        // 强制形式
    } else if let example = item as? Maths {
        print("数学主题是: '\(example.physics)',  \(example.formulae)")
    }
}

//Any 和 AnyObject 的类型转换
//Swift 为不确定类型提供了两种类型别名：
//AnyObject 可以代表任何class类型的实例
//Any可以表示任何类型，包括方法类型
//注意：
//只有当你明确的需要它的行为和功能时才使用Any和AnyObject。在你的代码里使用你期望的明确的类型总是更好的。

//Any
// 可以存储Any类型的数组 exampleany
var exampleany = [Any]()

exampleany.append(12)
exampleany.append(3.14159)
exampleany.append("Any 实例")
exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))

for item2 in exampleany {
    switch item2 {
    case let someInt as Int:
        print("整型值为 \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Pi 值为 \(someDouble)")
    case let someString as String:
        print("\(someString)")
    case let phy as Chemistry:
        print("主题 '\(phy.physics)', \(phy.equations)")
    default:
        print("None")
    }
}

//AnyObject
// [AnyObject] 类型的数组
let saprint: [AnyObject] = [
    Chemistry(physics: "固体物理", equations: "赫兹"),
    Maths(physics: "流体动力学", formulae: "千兆赫"),
    Chemistry(physics: "热物理学", equations: "分贝"),
    Maths(physics: "天体物理学", formulae: "兆赫"),
    Maths(physics: "微分方程", formulae: "余弦级数")]

for item in saprint {
    
    // 类型转换的条件形式
    if let show = item as? Chemistry {
        print("化学主题是: '\(show.physics)', \(show.equations)")
        // 强制形式
    } else if let example = item as? Maths {
        print("数学主题是: '\(example.physics)',  \(example.formulae)")
    }
}
