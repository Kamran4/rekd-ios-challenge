import UIKit
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewLayout: CustomImageFlowLayout!
    var indexForTitleDetails = 0
    var imageData: [String] = []
    let characterBio: [String: String] = ["name": "Son Goku", "Race": "Saiyan", "Favorite food": "Everything", "About": "Originally named Kakarot, Goku is born a member of a race of extraterrestrials called the Saiyans."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionViewLayout = CustomImageFlowLayout()
        self.collectionView.collectionViewLayout = self.collectionViewLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        characterName.text = characterBio["name"]
        getCharacterImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        
        DispatchQueue.main.async {
            let index: Int = indexPath.max()!
            let url = self.imageData[index]

            cell.imageView.af_setImage(withURL: URL(string: url)!)
            
            cell.imageView.contentMode = .scaleAspectFill
            cell.clipsToBounds = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    @IBAction func goBack(segue:UIStoryboardSegue) {
    }
    
    func getCharacterImages() {
        Alamofire.request(AppURL.Domains.API + AppURL.Routes.Character + "/246/pictures", method: .get).responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                if let json = response.result.value, let jObject = json as? [String: Any] {
                    DispatchQueue.main.async {
                        print(json)
                        let pictureObj = jObject["pictures"] as? NSArray
                        self.imageData.removeAll()
                        
                        for picture in pictureObj! {
                            let pictureData = picture as? [String: Any]
                            self.imageData.append(pictureData?["large"] as! String)
                        }
                        self.collectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
