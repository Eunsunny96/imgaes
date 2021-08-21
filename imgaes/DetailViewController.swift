//
//  DetailViewController.swift
//  imgaes
//
//  Created by sunny h on 2021/08/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM 찾기
    // Model
    // 현상금에 대한 정보
    // -BountyInfo
    // > BountyInfo 만들지
    
    // View
    // -imageView, nameLable, bountyLable
    // > view 들은 viewModel을 통해서 구성되기
    //> ListCell은 ViewModel에서  받은 정보를 뷰 업데이트 하기
    
    // ViewModel
    // - DetailViewModel을
    // > viewLayer에서 필요한 메소드 만들기
    // > 모델 가지고 있기,, BountyInfo들
    //
    
    
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
    

   
    @IBAction func close(_ sender: Any) {
        
        // 이버튼을 눌르면 사라지게,completion 이 버튼을 눌르고 이후에 행동될것
        dismiss(animated: true, completion: nil)
    }
    
    // 데이터들이 꽂히면 넘어올때 해당 데이터를 세팅
    
    func updateUI(){
        
        if let bountyInfo = viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLable.text = bountyInfo.name
            bountyLable.text = "\(bountyInfo.bounty)"

        }
        
        
        
//        if let bountyInfo = self.bountyInfo{
//            imgView.image = bountyInfo.image
//            nameLable.text = bountyInfo.name
//            bountyLable.text = "\(bountyInfo.bounty)"
//
//        }
        
//        if let name = self.name, let bounty = self.bounty{
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLable.text = name
//            bountyLable.text = "\(bounty)"
//        }
        
    }
    
    
    class DetailViewModel {
        var bountyInfo: BountyInfo?
        
        func update(model: BountyInfo?){
            bountyInfo = model
        }

    }
}
