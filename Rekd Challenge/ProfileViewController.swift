import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    @IBAction func goBack(segue:UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
