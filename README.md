# Stanford-Developing-iOS-

# 계산기 앱


내가 겪었던 문제 
let digit = sender.currentTitle <--- 이부분이 안돼... 
print("\(digit)")
해보면 모두 nil 로 나옴... 왜??

currentTitle 이 nil 로 나온이유는
iOS 15+의 UIButton.Configuration API를 사용하는 하기때문... 그러면 어떻게 해야하는데? 
 
 // iOS 15+ Configuration 방식
button.configuration?.title = "1"  // ✅ 이렇게 저장됨

// 하지만 현재 내가 접근하는 방식
button.currentTitle  // ❌ nil 반환! (Configuration 사용 시)


sender.configuration?.title  이렇게 바꿔줘야함

결론: 오토레이아웃 문제가 아니라 iOS 15+ Configuration API 때문입니다.
 

