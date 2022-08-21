import Foundation
    
final class UserInfo {
    
    private enum userCase : String {
        case money
        case level
    }
    
    static var moneys : Int! {
        
        get {return UserDefaults.standard.integer(forKey: userCase.money.rawValue )}
        set {
            let defaults = UserDefaults.standard
            let key = userCase.money.rawValue
            if let money = newValue {
                defaults.set(money, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
    
    static var level : Int! {
        get{return UserDefaults.standard.integer(forKey: userCase.level.rawValue)}
        set{
            let defaults = UserDefaults.standard
            let key = userCase.level.rawValue
            if let level = newValue{
                print("object :\(level) was save in device ")
                defaults.set(level, forKey: userCase.level.rawValue)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
}
