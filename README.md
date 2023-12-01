# EasyLINESeed
SwiftUI、及びUIKitで開発するアプリにおいて、日本語フォントの可読性向上のためにLINE Seedを利用する際の
導入・及び管理を簡単に行うためのPackageである。

## 利用方法
SwiftUI.Fontを拡張し、内部的には`.custom`を利用しているため、fixedとrelativeを利用することができる。  
UIKitはUIFontを拡張している。  

利用例：

```swift
struct SwiftUIView: View {
    let message = #"""
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """#
    
    var body: some View {
        ScrollView {
            Text(message)
                .font(.LINESeed.fixed(.thin, size: 10))
            Text(message)
                .font(.LINESeed.fixed(.regular, size: 10))
            Text(message)
                .font(.LINESeed.fixed(.bold, size: 10))
            Text(message)
                .font(.LINESeed.fixed(.extraBold, size: 10))
        }
    }
}
```

largeTitle、title、subTitle、body、footnoteを指定して利用することもできる。

```swift
            Text(message)
                .font(.LINESeed.footnote)
```

対応するフォント（SwiftUI）
|フォント名|weight|
|:----:|:----:|
|LINESeedJP_A_OTF_Bd| .bold|
|LINESeedJP_A_OTF_Eb| .extraBold|
|LINESeedJP_A_OTF_Rg| .regular|
|LINESeedJP_A_OTF_Th| .thin|

## UIKitでの利用方法

UIFontの拡張であるため、fontの指定で利用ができる

```swift
    // フォントの指定に利用する
    label.font = .LINESeed.custom(.extraBold, size: 20)
    // 以下はシステムのフォントと同じ大きさでLINESeedを利用したもの
    label.font = .LINESeed.largeTitle // Eb
    label.font = .LINESeed.title // bd
    label.font = .LINESeed.subTitle // bd
    label.font = .LINESeed.body // rg
    label.font = .LINESeed.footnote // th
```


## 注意事項
ライブラリにフォントファイルが含まれるため、約16MB程度の容量を必要とする

## LINESeedフォントのライセンス表示
このリポジトリ（及び、Swift package）には次のフォントが含まれています:

フォント名: LINE Seed    
フォントのライセンス所有者: LY Corporation    
フォントのウェブサイト: [LINE Seed JP](https://seed.line.me/index_jp.html)    

このフォントはSIL Open Font License, Version 1.1の下でライセンスされています。    

Copyright 2020-2022 LY Corporation    
This Font Software is licensed under the SIL Open Font License, Version 1.1.    
This license is copied below, and is also available with a FAQ at:    
http://scripts.sil.org/OFL    
