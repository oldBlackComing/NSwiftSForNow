//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift 继承
//继承我们可以理解为一个类获取了另外一个类的方法和属性。
//当一个类继承其他类时，继承类叫子类，被继承类叫超类（或父类）
//在Swift中，类可以调用和访问超类的方法，属性和下表脚本，并且可以重写他们。
//我们也可以为类中继承来的属性添加属性观察器

//基类
//没有继承其它类的类，称之为基类（Base Class）。
//以下实例中我们定义了基类 StudDetails ，描述了学生（stname）及其各科成绩的分数(mark1、mark2、mark3)：
class StudentDetail {
    var stName: String = "None"
    var mark1: Double = 0
    var mark2: Double = 0
    var mark3: Double = 0
    
    init(_ stName:String, mark1:Double, mark2:Double, mark3:Double) {
        self.stName = stName
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
    
}

let stname = "swift"
let mark1:Double = 98
let mark2:Double = 89
let mark3:Double = 76

let sds = StudentDetail.init(stname, mark1: mark1, mark2: mark2, mark3: mark3)

print(sds.stName)
print(sds.mark1)
print(sds.mark2)
print(sds.mark3)

//子类
//子类指的是在一个已有类的基础上创建一个新的类。
//为了指明某个类的超类，将超类名写在子类名的后面，用冒号(:)分隔,语法格式如下

class StudDetails
{
    var mark1: Int;
    var mark2: Int;
    
    init(stm1:Int, results stm2:Int)
    {
        mark1 = stm1;
        mark2 = stm2;
    }
    
    func show()
    {
        print("Mark1:\(self.mark1), Mark2:\(self.mark2)")
    }
}

class Tom : StudDetails
{
    init()
    {
        super.init(stm1: 93, results: 89)
    }
}

let tom = Tom()
tom.show()
