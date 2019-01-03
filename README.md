# StringCalculate

一种更加方便和高效计算多行Label高度的新方法


与系统的提供的boundingRect相比，优点主要有以下两点：

1.耗时较少

在Demo和我们实际项目中测试结果中，时间消耗约为系统的boundingRect方法的30%。

2.调用更加方便。

在使用系统的boundingRect方法进行Label高度计算时，通常情况下，我们需要根据最大行数来估算Label最大的高度，类似于这样：
```
let maxLine = 3//最大行数
let singleLineHeight = 20//单行高度
let maxHeight = CGFloat(maxLine * singleLineHeight)//计算得到最大宽度
let rect = text.boundingRect(with: CGSize(width: UIScreen.main.bounds.size.width, height: maxHeight),
                                      options: .usesLineFragmentOrigin,
                                      attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)],
                                      context: nil).size.width
```
但是在使用这种新方法计算时，我们只需要指定最大高度就行了，类似于这样：
```
let rect = text.boundingRectFast(withMaxWidth: UIScreen.main.bounds.size.width, font: UIFont.boldSystemFont(ofSize: 16), maxLine: maxLine)
```

                   
