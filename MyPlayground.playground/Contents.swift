//: Playground - noun: a place where people can play

import UIKit
//import Cocoa

var str = "Hello, playground"
var myString = "Hello World"

Int.min
Int.max
for ch in "Hello World".characters {
    print(ch)
}

let stringL = "Hello\tWorld\n\n菜鸟教程官网：\'http://www.runoob.com\'"
print(stringL)

struct aaaaa{
    var value: Int = 100
    var change: Int = 200
    
    
}
print(aaaaa(value:1, change:2).value)


struct Rectangle {
    var length = 100.0, breadth = 200.0
    
}
let area = Rectangle(length: 24.0, breadth: 32.0)
let aaaaaaaaaa = Rectangle()

print("矩形的面积: \(area.length)")
print("矩形的面积: \(area.breadth)")

struct Animal {
    let species: String
    init?(species: String) {
        print("--init--")
        if species.isEmpty { return nil }
        self.species = species
    }
}

//通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
// someCreature 的类型是 Animal? 而不是 Animal
let someCreature = Animal(species: "")

// 打印 "动物初始化为长颈鹿"
if let giraffe = someCreature {
    print("动物初始化为\(giraffe.species)")
}else{
    print("动物初始化为")
}
print("aaaaaaaaaaaaaa-----------------------------------------")
let a = Animal.init(species: "dwsadasdasdasda")
if  a != nil{
    print("------\(String(describing: a?.species))")
}else{
    print("dasasasdasdas")
}

struct StudRecord {
    let stname: String
    
    init!(stname: String) {
        if stname.isEmpty {return nil }
        self.stname = stname
    }
}

let stmark = StudRecord(stname: "Runoob")
if let nameeee = stmark {
    print("指定了学生名\(nameeee)")
}

let blankname = StudRecord(stname: "")
if blankname?.stname == nil {
    print("学生名为空\(String(describing: blankname?.stname))")
}


class Person1 {
    var residence: Residence?
    init() {
        self.residence = Residence()


    }
}

class Residence {
    var numberOfRooms: Int?
//    unowned var aaaaaaa : Person1?
    
}
let resi:Residence = Residence()
resi.numberOfRooms = 10

let john = Person1.init()

// 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
if  john.residence != nil {
    print("John 的房间号为 \(String(describing: john))。")
} else {
    print("不能查看房间号")
}

var array: Array = Array<String>()

print("----------\(john.residence!.numberOfRooms)")
class StudDetails {
    var a:Int{
        return 10
            }

    var stname: String!
    var mark1: Int!
    var mark2: Int!
    var mark3: Int!
    var residence: Residence?
    
    init() {
        self.stname = "stname"
        self.mark1 = 1
        self.mark2 = 2
        self.mark3 = 3
    self.residence = Residence()
    }
    init(stname: String, mark1: Int, mark2: Int, mark3: Int) {
        self.stname = stname
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
        
    }
    
    init(stname: String, mark1: Int, mark2: Int) {
        self.stname = stname
        self.mark1 = mark1
        self.mark2 = mark2
    }
    init(stn1ame: String, mark1: Int, mark2: Int) {
        self.stname = stn1ame
        self.mark1 = mark1
        self.mark2 = mark2
    }
}





class Module {
    let name: String
    init(name: String) { self.name = name }
    var sub: SubModule?
    deinit { print("\(name) 主模块") }
}

class SubModule {
    let number: Int
    
    init(number: Int) { self.number = number }
    
    weak var topic: Module?
    
    deinit { print("子模块 topic 数为 \(number)") }
}

var toc: Module?
var list: SubModule?
toc = Module(name: "ARC")


list = SubModule(number: 4)
toc!.sub = list
list!.topic = toc

toc = nil
list = nil







class Subjects {
    var physics: String
    init(physics: String) {
        self.physics = physics
    }
}

class Chemistry: Subjects {
    var equations: String
    init(physics: String, equations: String) {
        self.equations = equations
        super.init(physics: physics)
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
    Maths(physics: "流体动力学", formulae: "千兆赫"),
    Chemistry(physics: "热物理学", equations: "分贝"),
    Maths(physics: "天体物理学", formulae: "兆赫"),
    Maths(physics: "微分方程", formulae: "余弦级数")]


let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
print("实例物理学是: \(samplechem.physics)")
print("实例方程式: \(samplechem.equations)")


let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
print("实例物理学是: \(samplemaths.physics)")
print("实例公式是: \(samplemaths.formulae)")

var chemCount = 0
var mathsCount = 0

for item in sa {
    // 类型转换的条件形式
    if let show = item as? Chemistry {
        print("化学主题是: '\(show.physics)', \(show.equations)")
        // 强制形式
    } else if let example = item as? Maths {
        print("数学主题是: '\(example.physics)',  \(example.formulae)")
    }
}





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

var array1:[Any] = []
array1.append("str")


var array2 = [Any]()

var array3:[Any] = []




