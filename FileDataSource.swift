import Foundation
import UIKit

class FileDataSource{
    
   static func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else {return}
        
        if FileManager.default.fileExists(atPath: fileURL.path){
            do{
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("старое фото удалено")
            }
            catch{
                print("Error : \(error)")
            }
        }
        
        do{
            try data.write(to: fileURL)
            print("новое фото добавлено!")
        }
        catch{
            print("Error write \(error)")
        }
    }
    
   static func loadImageFromDiskWith(fileName : String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageURL.path)
            print("фото получено")
            return image
        }
        return nil
    }
    
}
