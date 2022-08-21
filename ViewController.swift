import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var buyMinerButton: UIButton!
    @IBOutlet weak var buyMachineButton: UIButton!
    @IBOutlet weak var buyExcalatorButton: UIButton!
    
    @IBOutlet weak var hideText: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var minersPrice: UILabel!
    @IBOutlet weak var machinesPrice: UILabel!
    @IBOutlet weak var excavatorsPrice: UILabel!
    
    @IBOutlet weak var countOfMoneysInSecMiners: UILabel!
    @IBOutlet weak var countOfMoneysInSecMachines: UILabel!
    @IBOutlet weak var countOfMoneysInSecExcavators: UILabel!
    
    let generator = UISelectionFeedbackGenerator()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        GameInfo.countOfMoneysInSecExcavators = 0
//        GameInfo.countOfMoneysInSecMachines = 0
//        GameInfo.countOfMoneysInSecMiners = 0
        
        GameInfo.minersPrice = 150
        GameInfo.machinePrice = 1000
        GameInfo.excavatorPrice = 5000
        
        updatePrice()

        passiveMoneys(GameInfo.miners, GameInfo.countOfMoneysInSecMiners)
        passiveMoneys(GameInfo.machines, GameInfo.countOfMoneysInSecMachines)
        passiveMoneys(GameInfo.excavators, GameInfo.countOfMoneysInSecExcavators)

  
        moneyLabel.text = "$\(UserInfo.moneys!)"
        moneyCheckCodeRef()
        
        if GameInfo.data == 1 {
            hideText.isHidden = true
        }
    }
    
    @IBAction func click(_ sender: UIButton) {
                
        GameInfo.data = 1
        
        if GameInfo.data == 1 {
            hideText.isHidden = true
        }
        
        generator.selectionChanged()
        
        UserInfo.moneys += 1
        moneyLabel.text = "$\(UserInfo.moneys!)"
        moneyCheckCodeRef()
    }
    
    @IBAction func minerButton(_ sender: UIButton) {
        
        generator.selectionChanged()
        GameInfo.countOfMoneysInSecMiners += 1
//        GameInfo.miners += 1
        buyBooster(GameInfo.miners, 150, sender)
        moneyCheckCodeRef()
        passiveMoneys(GameInfo.miners, GameInfo.countOfMoneysInSecMiners)

    }
    
    @IBAction func machineButton(_ sender: UIButton){
        
        generator.selectionChanged()
        GameInfo.countOfMoneysInSecMachines += 2
        GameInfo.machines += 3
        buyBooster(GameInfo.machines, 1000, sender)
        moneyCheckCodeRef()
        passiveMoneys(GameInfo.machines, GameInfo.countOfMoneysInSecMachines)

    }
    
    @IBAction func excalatorButton(_ sender: UIButton){
        
        generator.selectionChanged()
        GameInfo.countOfMoneysInSecExcavators += 5
        GameInfo.excavators += 10
        buyBooster(GameInfo.excavators, 5000, sender)
        moneyCheckCodeRef()
        passiveMoneys(GameInfo.excavators, GameInfo.countOfMoneysInSecExcavators)
        
    }
    
    private func moneyCheck(_ boostersCount: Int, _ button : UIButton){
        
        if UserInfo.moneys < boostersCount{
            button.isEnabled = false
        }
        else{
            button.isEnabled = true
        }
    }
    
    private func buyBooster(_ booster : Int , _ boostersCount: Int, _ button: UIButton){
        let sum = UserInfo.moneys - boostersCount
        UserInfo.moneys = sum
        moneyCheck(boostersCount, button)
        moneyLabel.text = "$\(UserInfo.moneys!)"
    }
    
    func passiveMoneys(_ booster : Int , _ countOf : Int){
        self.updateMoneysInSecondWithBooster()
        timer?.invalidate()
        if booster >= 1 {
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                UserInfo.moneys += countOf
//                UserInfo.moneys += GameInfo.countOfMoneysInSecMachines
//                UserInfo.moneys += GameInfo.countOfMoneysInSecExcavators
                self.moneyLabel.text = "$\(UserInfo.moneys!)"
                self.moneyCheck(GameInfo.minersPrice, self.buyMinerButton)
                self.moneyCheck(GameInfo.machinePrice, self.buyMachineButton)
                self.moneyCheck(GameInfo.excavatorPrice, self.buyExcalatorButton)
            }
        }
    }
    
    func moneyCheckCodeRef(){
        moneyCheck(GameInfo.minersPrice, buyMinerButton)
        moneyCheck(GameInfo.machinePrice, buyMachineButton )
        moneyCheck(GameInfo.excavatorPrice, buyExcalatorButton)
    }
    
    func updatePrice(){
        minersPrice.text = "$\(GameInfo.minersPrice!)"
        machinesPrice.text = "$\(GameInfo.machinePrice!)"
        excavatorsPrice.text = "$\(GameInfo.excavatorPrice!)"
    }
    
    func updateMoneysInSecondWithBooster(){
        
        countOfMoneysInSecMiners.text = "+ \(GameInfo.countOfMoneysInSecMiners!) в сек"
        countOfMoneysInSecMachines.text = "+ \(GameInfo.countOfMoneysInSecMachines!) в сек"
        countOfMoneysInSecExcavators.text = "+ \(GameInfo.countOfMoneysInSecExcavators!) в сек"
        
    }
}
