
import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeTypeText: UITextField!
    
    @IBOutlet weak var DescriptionText: UITextField!
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.isUserInteractionEnabled = true
        
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRecogniser)
        
        
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
     
        if placeNameText.text != "" && placeTypeText.text != "" && DescriptionText.text != "" {
            if let chosenImage = placeImageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeDescription = DescriptionText.text!
                placeModel.placeImage = chosenImage
            }
        }
          performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    @objc func chooseImage () {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
