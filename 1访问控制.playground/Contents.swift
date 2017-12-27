//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//访问级别    定义
//public    可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的所有实体。
//internal    可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体。
//fileprivate    文件内私有，只能在当前源文件中使用。
//private    只能在类中访问，离开了这个类或者结构体的作用域外面就无法访问。
class aaaaa:UIViewController{
//private lazy var textView: TextView = {
//    let view = TextView(viewModel: self.textViewModel)
//    view.frame = UIScreen.main.bounds
//    return view
//}()
//
//private lazy var textViewModel: TextViewModel = {
//    let model = TextViewModel()
//    return model
//}()
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    view.addSubview(textView)
//}


}
class CustomView: UIView {
    let param: Int

//    init() {
////        super.init(frame: frame)
//
//    }
    
    override init(frame: CGRect) {
        self.param = 1
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.param = 1
        super.init(coder: aDecoder)
    }
    

}
class CustomView1: UIView {
    init(param: Int, frame1:CGRect) {
        self.param = param
        super.init(frame:frame)
    }
    convenience init(param: Int, frame: CGRect) {
        self.init(frame: frame)
        self.param = param // error fixed
    }
    
    override init(frame: CGRect) {
        self.param = 0 // error fixed
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.param = 0
        super.init(coder: aDecoder)
    }
    var param: Int

}
//let v1 = CustomView1.init(param: <#T##Int#>, frame1: <#T##CGRect#>)

//class TextView: UITextView{
//     init(viewModel: TextViewModel) {
////        textViewModel = viewModel
//        //添加子视图
////        setupSubViews()
//        //绑定ViewModel， 使用 通知 or KVO
////        bindingViewModel()
//        //请求数据
////        textViewModel.requestData()
//        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
class TextViewModel {
    
}

//class CustomView1: UIView {
////    var param: Int
//
//    convenience init(param: Int, frame: CGRect) {
//        self.init(frame: frame)
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame) // error
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}


