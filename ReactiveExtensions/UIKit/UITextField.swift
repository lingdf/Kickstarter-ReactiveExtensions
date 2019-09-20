import ReactiveSwift
import UIKit

private enum Associations {
  fileprivate static var attributedPlaceholder = 0
  fileprivate static var text = 0
  fileprivate static var textColor = 0
}

public extension Rac where Object: UITextField {
  public var attributedPlaceholder: Signal<NSAttributedString, Never> {
    nonmutating set {
      let prop: MutableProperty<NSAttributedString> = lazyMutableProperty(
        object,
        key: &Associations.attributedPlaceholder,
        setter: { [weak object] in object?.attributedPlaceholder = $0 },
        getter: { [weak object] in object?.attributedPlaceholder ?? NSAttributedString(string: "") })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }

  public var text: Signal<String, Never> {
    nonmutating set {
      let prop: MutableProperty<String> = lazyMutableProperty(
        object,
        key: &Associations.text,
        setter: { [weak object] in object?.text = $0 },
        getter: { [weak object] in object?.text ?? "" })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }

  var textColor: Signal<UIColor?, Never> {
    nonmutating set {
      let prop: MutableProperty<UIColor?> = lazyMutableProperty(
        object,
        key: &Associations.textColor,
        setter: { [weak object] in object?.textColor = $0 },
        getter: { [weak object] in object?.textColor ?? nil })

      prop <~ newValue.observeForUI()
    }

    get {
      return .empty
    }
  }
}
