import Foundation

class GameInfo{
    
    private enum Boosters : String{
        case miners
        case minersPrice
        case machines
        case machinePrice
        case excavators
        case excavatorPrice
        case data
        case countOfMoneysInSecMiners
        case countOfMoneysInSecMachines
        case countOfMoneysInSecExcavators
    }
    
    static var excavators : Int! {
        get{return UserDefaults.standard.integer(forKey: Boosters.excavators.rawValue)}
        set{
            let defaults = UserDefaults.standard
            let key = Boosters.excavators.rawValue
            if let excavators = newValue {
                defaults.set(excavators, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
    static var excavatorPrice : Int! {
        get{return UserDefaults.standard.integer(forKey: Boosters.excavatorPrice.rawValue)}
        set{
            let defaults = UserDefaults.standard
            let key = Boosters.excavatorPrice.rawValue
            if let excavatorPrice = newValue {
                defaults.set(excavatorPrice, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
    static var machines : Int! {
        get{return UserDefaults.standard.integer(forKey: Boosters.machines.rawValue)}
        set{
            let defaults = UserDefaults.standard
            let key = Boosters.machines.rawValue
            if let machines = newValue {
                defaults.set(machines, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
    static var machinePrice : Int! {
        get{return UserDefaults.standard.integer(forKey: Boosters.machinePrice.rawValue)}
        set{
            let defaults = UserDefaults.standard
            let key = Boosters.machinePrice.rawValue
            if let machinePrice = newValue {
                defaults.set(machinePrice, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
        
    static var miners : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.miners.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.miners.rawValue
            if let miner = newValue {
                defaults.set(miner, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
    static var minersPrice : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.minersPrice.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.minersPrice.rawValue
            if let minerPrice = newValue {
                defaults.set(minerPrice, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
                print("object \(key) was removed for device")
            }}}
    
    static var data : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.data.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.data.rawValue
            if let data = newValue {
                defaults.set(data, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
    
    static var countOfMoneysInSecMiners : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.countOfMoneysInSecMiners.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.countOfMoneysInSecMiners.rawValue
            if let countOfMoneysInSecMiners = newValue {
                defaults.set(countOfMoneysInSecMiners, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
    
    static var countOfMoneysInSecMachines : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.countOfMoneysInSecMachines.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.countOfMoneysInSecMachines.rawValue
            if let countOfMoneysInSecMachines = newValue {
                defaults.set(countOfMoneysInSecMachines, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
    
    static var countOfMoneysInSecExcavators : Int! {
        get {return UserDefaults.standard.integer(forKey: Boosters.countOfMoneysInSecExcavators.rawValue)}
        set {
            let defaults = UserDefaults.standard
            let key = Boosters.countOfMoneysInSecExcavators.rawValue
            if let countOfMoneysInSecExcavators = newValue {
                defaults.set(countOfMoneysInSecExcavators, forKey: key)
            }
            else {
                defaults.removeObject(forKey: key)
            }}}
    
}
