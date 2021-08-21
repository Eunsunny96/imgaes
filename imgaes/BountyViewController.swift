//
//  BountyViewController.swift
//  imgaes
//
//  Created by sunny h on 2021/08/21.
//

import UIKit

class BountyViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    // MVVM 찾기
    // Model
    // 현상금에 대한 정보
    // -BountyInfo
    // > BountyInfo 만들지
    
    // View
    // - ListCell 각각의 현상금 정보를 리스트 형식으로 보여줌
    //> ListCell에 필요한 정보를 ViewModel 한테서 받아야 겠디
    //> ListCell은 ViewModel에서  받은 정보를 뷰 업데이트 하기
    
    // ViewModel
    // - BountyViewModel을
    // > BountyViewModel을 만들고, viewLayer에서 필요한 메소드 만들기
    // > 모델 가지고 있기,, BountyInfo들
    //
    
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 33000000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 44000000),
//        BountyInfo(name: "luffy", bounty: 300000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 800000),
//        BountyInfo(name: "sanji", bounty: 7700000),
//        BountyInfo(name: "zoro", bounty: 12000000)
//    ]
    
    let viewModel = BountyViewModel()
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000,50,44000000,300000,16000000,800000,7700000,12000000]
//
    // 현상금을 바꾸려고 찾다보면 어떻게 찾아야 될지 헷갈림
    
    
    // segueway를 수행하기 직전에 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detailviewController 한테 데이터를 줄꺼에요
        // 실제 데이터 세팅
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                let bountyInfo = viewModel.bountyInfo(at: index)
                //let bountyInfo = bountyInfoList[index]
                
//            vc?.name = nameList[index]
//            vc?.bounty = bountyList[index]
                vc?.viewModel.update(model: bountyInfo)
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // UITableViewDataSourcr 몇개니 ??
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //array의 갯수
        //return bountyList.count
        //return bountyInfoList.count
        return viewModel.numOfBountyInfoList
        
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 구분자, guard 셀의 위치 있는 경우에는 밑에 코드 수행, 그렇지 않은 경우엔 값 리턴 guard 문은 띄어쓰기가 안들어가는 효과가 있습니다
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }

//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//         cell.imageView?.image = img
//         cell.nameLable.text = nameList[indexPath.row]
//         cell.bountyLable.text = "\(bountyList[indexPath.row])"
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        //let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imageView?.image = bountyInfo.image
//        cell.nameLable.text = bountyInfo.name
//        cell.bountyLable.text = "\(bountyInfo.bounty)"
        return cell


        // guard 문이랑 같은 표현임
//            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell{
//                let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//                cell.imageView?.image = img
//                cell.nameLable.text = nameList[indexPath.row]
//                cell.bountyLable.text = "\(bountyList[indexPath.row])"
//                return cell
//            }else{
//                return UITableViewCell()
//            }
        }
    
    
    // 클릭됐을떄 어떻게 반응할꺼야 ?!!?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        // detailview 연결 ,sender 에  cell 에대한 정보를 줍니다
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        // 몇번째 셀이 클릭 ?!?
        
    }
    
    


}

    //custom cell 만들기
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
    
    
    func update(info: BountyInfo){
        imageView?.image = info.image
        nameLable.text = info.name
        bountyLable.text = "\(info.bounty)"
    }
}


// MVVM Model
struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}
// viewModel
class BountyViewModel{
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 800000),
        BountyInfo(name: "sanji", bounty: 7700000),
        BountyInfo(name: "zoro", bounty: 12000000)
    ]
    
    var numOfBountyInfoList: Int{

        return bountyInfoList.count
    }
    func bountyInfo(at index: Int) -> BountyInfo {
        return bountyInfoList[index]
    }
}
