import UIKit

final class KoreanArtWorkTableViewController: UITableViewController {
    private var expositionItems: [ExpositionItem] = []
    private let defaultSectionCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expositionItems = try? JSONParser.decodeData(of: "items", type: [ExpositionItem].self).get() else {
            self.expositionItems = []
            return
        }
        
        self.expositionItems = expositionItems
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? KoreanArtWorkTableViewCell else { return }
        
        if let destinationVC = segue.destination as? ArtWorkDetailViewController {
            let rowIndex = tableView.indexPath(for: cell)?.row
            destinationVC.rowIndex = rowIndex
        }
    }
}

extension KoreanArtWorkTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return defaultSectionCount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "artWorkItem"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if let cell = cell as? KoreanArtWorkTableViewCell {
            cell.cellTitleLabel.text = expositionItems[indexPath.row].name
            cell.cellDetailLabel.text = expositionItems[indexPath.row].shortDescription
            cell.cellImageViewLabel.image = UIImage(named: expositionItems[indexPath.row].imageName)
        }
        
        return cell
    }
}
