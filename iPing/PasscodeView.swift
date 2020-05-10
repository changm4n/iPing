//
//  PasscodeView.swift
//  iPing
//
//  Created by kakao on 2020/05/01.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import Combine

struct PasscodeView: View {
    @Binding var show: Bool
    @State var phoneNumber: String = ""
    
    @State var passcodeField = PasscodeField()
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @GestureState private var dragOffset = CGSize.zero
    var btnBack : some View { Button(action: {
        self.show.toggle()
    }) {
        Image("back") // set image here
            .foregroundColor(Color("blackGray"))
        }
    }
    
    @State var passcode: String = ""
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("인증번호를\n입력해주세요").font(.custom("NotoSansCJKjp-Medium", size: 24)).fixedSize()
                            Text("+821095156755에 전송함").font(.custom("NotoSansCJKjp-Medium", size: 14)).foregroundColor(Color("blackGray")).fixedSize()
                        }.frame(height: 100)
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height: 90)
                    passcodeField.frame(height: 30)
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        
                        Button(action: {
                            self.viewControllerHolder?.present(style: .fullScreen) {
                                          ContentView()
                                       }
                            
                        }) {
                            Text("다음")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 152, height: 44)
                        }
                        .background(Color("theme"))
                        .clipShape(Capsule())
                        .modifier(AdaptsToSoftwareKeyboard())
                    }
                }
                .padding(.horizontal, 24)
            }.navigationBarTitle("", displayMode: .automatic)
        }
    }
    
}

struct PasscodeField: View {
    @State var isRespond: Bool? = true
    
    @ObservedObject var viewModel: PasscodeViewModel = PasscodeViewModel()
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center, spacing: 30) {
                ForEach(self.viewModel.codes) { (code) in
                    Circle().frame(width: 16, height: 16)
                        .foregroundColor(code.active ? Color("theme") : Color("defaultGray"))
                }
            }
            
            CustomTextField(text: $viewModel.codeInput, isResponder: $isRespond, keyboard: UIKeyboardType.numberPad)
        }
    }
}

class PasscodeViewModel: ObservableObject {
    @Published var codeInput: String = "" {
        didSet {
            if codeInput.count > 4 && oldValue.count <= 4 {
                codeInput = oldValue
            }
        }
    }
    
    @Published var codes: [Digit] = [Digit(), Digit(), Digit(), Digit()]
    
    private var disposables = Set<AnyCancellable>()
    init() {
        $codeInput.filter({
            $0.count < 5
        })
            .sink(receiveValue: {
                print("input code : \($0)")
                for i in 0...3 {
                    self.codes[i].value = $0.getStrBy(index: i)
                }
            }).store(in: &disposables)
    }
}

struct Digit: Identifiable {
    var id = UUID()
    var value: String = "" {
        didSet {
            active = value != ""
        }
    }
    
    var active: Bool = false
}



extension String {
    func substring(to: Int) -> String {
        guard self.count > to else {
            return self
        }
        
        let range = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex...range])
        
    }
    
    func getStrBy(index idx: Int) -> String {
        if self.count > idx {
            let range = self.index(self.startIndex, offsetBy: idx)
            return String(self[range])
        }
        
        return ""
    }
}

//
struct PasscodeView_Previews: PreviewProvider {
    @State var show: Bool = true
    static var previews: some View {
        PasscodeView(show: .constant(false))
    }
}



struct AdaptsToSoftwareKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, currentHeight - 10)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear(perform: subscribeToKeyboardEvents)
    }
    
    private func subscribeToKeyboardEvents() {
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillShowNotification
        ).compactMap { notification in
            notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        }.map { rect in
            rect.height
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
        
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillHideNotification
        ).compactMap { notification in
            CGFloat.zero
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
    }
}
