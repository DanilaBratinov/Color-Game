import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlet
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var editableView: UIView!
    
    
    @IBOutlet var redCounter: UILabel!
    @IBOutlet var greenCounter: UILabel!
    @IBOutlet var blueCounter: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editMainView()
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
        setupCounter()
        slidersAction()
        print(redColor, greenColor, blueColor)
    }
    
    
    
    //MARK: - IB Action
    
    @IBAction func slidersAction() {
        editableView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1
        )
        
        redCounter.text = String(format: "%.2f", redSlider.value)
        greenCounter.text = String(format: "%.2f", greenSlider.value)
        blueCounter.text = String(format: "%.2f", blueSlider.value)
        nextLevel()
    }
    
    @IBAction func helpAction() {
        
    }
    var redColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
    var greenColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
    var blueColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
    
    private func editMainView() {
        redColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
        greenColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
        blueColor = round(CGFloat(Float.random(in: 0...1)) * 100) / 100
        
        mainView.backgroundColor = UIColor.init(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
        mainView.layer.cornerRadius = mainView.frame.width / 10
        editableView.layer.cornerRadius = editableView.frame.width / 20
    }
    
    private func setupCounter() {
        redCounter.text = "0.00"
        greenCounter.text = "0.00"
        blueCounter.text = "0.00"
    }
    
    private func setupRedSlider() {
        redSlider.value = 0
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
    }
    
    private func setupGreenSlider() {
        greenSlider.value = 0
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
    }
    
    private func setupBlueSlider() {
        blueSlider.value = 0
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
    }
    
    private func nextLevel() {
        if round(redSlider.value * 100) / 100 == Float(redColor) && round(greenSlider.value * 100) / 100 == Float(greenColor) && round(blueSlider.value * 100) / 100 == Float(blueColor) {
            showAlert(withTitle: "Уровень пройден!", andMessage: "Перейти к следующему уровню")
        }
    }
}
//MARK: - UIAlertController
extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Далее", style: .default) { _ in
            self.editMainView()
            self.viewDidLoad()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
