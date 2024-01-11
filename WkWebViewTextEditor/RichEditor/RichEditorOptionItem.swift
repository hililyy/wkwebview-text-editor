import UIKit

protocol RichEditorOption {
    var image: UIImage? { get }
    var title: String { get }
    func action(_ editor: RichEditorToolbar)
}

struct RichEditorOptionItem: RichEditorOption {
    var image: UIImage?
    var title: String
    var handler: ((RichEditorToolbar) -> Void)

    init(image: UIImage?, title: String, action: @escaping ((RichEditorToolbar) -> Void)) {
        self.image = image
        self.title = title
        self.handler = action
    }
    
    func action(_ toolbar: RichEditorToolbar) {
        handler(toolbar)
    }
}

enum RichEditorDefaultOption: RichEditorOption {
    case indent
    case outdent
    case orderedList
    case unorderedList
    
    static let all: [RichEditorDefaultOption] = [
        .indent, outdent, orderedList, unorderedList
    ]
    
    var image: UIImage? {
        var name = ""
        switch self {
        case .indent: name = "ic_form_inline"
        case .outdent: name = "ic_form_outline"
        case .orderedList: name = "ic_form_number"
        case .unorderedList: name = "ic_form_circle"
        }
        
        let bundle = Bundle(for: RichEditorToolbar.self)
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }
    
    var title: String {
        switch self {
        case .indent: return NSLocalizedString("Indent", comment: "")
        case .outdent: return NSLocalizedString("Outdent", comment: "")
        case .orderedList: return NSLocalizedString("Ordered List", comment: "")
        case .unorderedList: return NSLocalizedString("Unordered List", comment: "")
        }
    }
    
    func action(_ toolbar: RichEditorToolbar) {
        switch self {
        case .indent: toolbar.editor?.indent()
        case .outdent: toolbar.editor?.outdent()
        case .orderedList: toolbar.editor?.orderedList()
        case .unorderedList: toolbar.editor?.unorderedList()
        }
    }
}
