//
//  DetailViewController.swift
//  BountyList
//
//  Created by 이민지 on 2022/01/14.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - imageView, nameLabel, BountyLabel
    // > view들은 viewModel를 통해서 구성되기
    
    // ViewModel
    // - DetailViewModel
    // > 뷰 레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기,, BountyInfo들

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
    
//    var name: String?
//    var bounty: Int?
    
//    var bountyInfo: BountyInfo?
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLable.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLable.text = name
//            bountyLable.text = "\(bounty)"
//        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
