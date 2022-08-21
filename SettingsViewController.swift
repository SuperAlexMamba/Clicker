import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let image = FileDataSource.loadImageFromDiskWith(fileName: "profileImage")
        if image != nil{ 
        profileImage.image = image
        }
    }

    @IBAction func cancelAction(_ sender: Any){
        dismiss(animated: true)
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.editedImage]{
            profileImage.image = image as? UIImage
            picker.dismiss(animated: true) {
                let alert = UIAlertController(title: "Успешно 😃", message: "Фото сохранено", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                FileDataSource.saveImage(imageName: "profileImage", image: image as! UIImage)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
}

