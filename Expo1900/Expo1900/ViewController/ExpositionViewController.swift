//
//  ExpositionViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class ExpositionViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var itemsListPageButton: UIButton!
    @IBOutlet private weak var leftOnButtonImageView: UIImageView!
    @IBOutlet private weak var rightOnButtonImageView: UIImageView!
    
    private var expoData: Exposition?
    private let navigationTitle: String = "메인"
    private let posterImage: String  = "poster"
    private let flagImage: String = "flag"
    private let listPageButtonTitle = "한국의 출품작 보러가기"
    private let PrePhraseVisitors: String = "방문객 : "
    private let PrePhraseLocation: String = "개최지 : "
    private let PrePhraseDuration: String = "개최 기간 : "
    private let titleLineNumber: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoData()
        setTitleLabelAttribute()
        initializeViews()
        self.navigationItem.title = navigationTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExpoData() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main) else {
            return
        }
        do {
            self.expoData = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
        } catch {
            implementErrorAlert(ExpoError.invalidExpoData)
        }
    }
    
    private func initializeViews() {
        guard let data = expoData else {
            return
        }
        titleLabel.text = data.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = PrePhraseVisitors + data.visitorsStringFormat
        locationLabel.text = PrePhraseLocation + data.location
        durationLabel.text = PrePhraseDuration + data.duration
        descriptionLabel.text = data.description
        posterImageView.image = UIImage(named: posterImage)
        itemsListPageButton.setTitle(listPageButtonTitle, for: .normal)
        leftOnButtonImageView.image = UIImage(named: flagImage)
        rightOnButtonImageView.image = UIImage(named: flagImage)
    }
    
    private func setTitleLabelAttribute() {
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = titleLineNumber
        descriptionLabel.numberOfLines = Int.zero
    }
    
    @IBAction private func pushItemsListPageButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "KoreanItemsListVC")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
