import UIKit

class KeyboardManager: NSObject {
    
    weak var view: UIView?
    
    var toolbar: RichEditorToolbar

    init(view: UIView) {
        self.view = view
        toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 44))
    }
    
    func beginMonitoring() {
        let sel = #selector(keyboardWillShowOrHide(_:))
        NotificationCenter.default.addObserver(self, selector: sel, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: sel, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func stopMonitoring() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShowOrHide(_ notification: Notification) {
        let info = notification.userInfo ?? [:]
        let duration = TimeInterval((info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.floatValue ?? 0.25)
        let curve = UInt((info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue ?? 0)
        let options = UIView.AnimationOptions(rawValue: curve)
        let keyboardRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero

        if notification.name == UIResponder.keyboardWillShowNotification {
            self.view?.addSubview(self.toolbar)
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.toolbar.frame.origin.y = view.frame.height - (keyboardRect.height + self.toolbar.frame.height)
                }
            }, completion: nil)


        } else if notification.name == UIResponder.keyboardWillHideNotification {
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.toolbar.frame.origin.y = view.frame.height
                }
            }, completion: nil)
        }
    }
}
