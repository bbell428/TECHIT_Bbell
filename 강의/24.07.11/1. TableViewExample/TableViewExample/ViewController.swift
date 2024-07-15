import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let nations: [String] = [
        // 아시아
        "일본", "베트남", "필리핀", "인도", "중국",
        
        // 오세아니아
        "호주", "뉴질랜드",
        
        // 아메리카
        "멕시코", "미국",
        
        // 유럽
        "스위스", "스웨덴", "독일", "오스트리아", "프랑스",
        "영국", "스페인", "독일", "아이슬란드", "노르웨이", "러시아",
        "덴마크", "우크라이나"]
    
    private let tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboard 없이 코드만으로
        // view안에 다른 view를 만들어 얹힐 수 있다.
        /*
        let myView: UIView = UIView()
        myView.frame = CGRect(x: 100, y: 120, width: 100, height: 50)
        myView.backgroundColor = .cyan
        view.addSubview(myView)
        */
        
        // 그래서 준비된 tableView도
        // 크기를 화면 전체로 조절해서
        // ViewController의 view 위에 얹혀보자
        tableView.frame = view.bounds
        // tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        
        // TableView가 요구하는 프로토콜들이 준비되었으니
        // 필요할 때 우리를 불러달라고 지정해줘야 한다
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell을 재활용하도록 미리 등록해놓기, (셀 등록 (셀 생성))
        // 메모리를 효율적으로 관리하기 위함
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // TableView에 특정 섹션마다 몇 개의 항목이 있는지
    // 요구받으면 우리가 알려줘야 한다
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nations.count
    }
    
    // 특정 위치를 요구받으면 우리는 그 위치에 적절한
    // TableView에 일부인 Cell을 만들어서 보내줘야한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nation: String = nations[indexPath.row]
        
        // 셀 재사용 (셀 가져오기), 만약 셀이 없다면 셀을 생성 (큐 형태)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello for section \(indexPath.section) / row \(indexPath.row)"
        cell.textLabel?.text = "\(nation)"
        return cell
    }
}

// Storyboard를 사용하지 않고
// 코드만으로 ViewController가 구성된다면
// Preview가 쉽게 됩니다
#Preview {
    ViewController()
}





/*
 
 종종 화면에는 한 번에 표시되는 셀의 수보다 더 많은 데이터가 있을 수 있습니다. 예를 들어, 테이블 뷰에 100개의 데이터가 있지만 한 번에 화면에 보이는 셀은 10개일 수 있습니다.

 재사용 셀 개념은 이런 상황에서 유용합니다. 기본적으로 테이블 뷰는 화면에 보이는 셀의 개수보다 조금 더 많은 셀을 메모리에 유지합니다. 이는 사용자가 스크롤을 할 때, 새로운 셀을 보여주기 위해 기존 셀을 재활용할 수 있도록 해줍니다.

 예를 들어, 사용자가 테이블 뷰를 스크롤하면, 화면에서 위로 사라지는 셀은 아래로 다시 보이게 됩니다. 이 때, 기존에 사라진 셀을 새로운 데이터로 업데이트하여 다시 사용할 수 있습니다. 이 과정에서 새로운 셀을 생성하는 비용을 줄이고, 메모리를 효율적으로 관리할 수 있습니다.

==================================================================================
 
사용자가 스크롤을 하면, 위로 사라지는 셀은 아래로 재사용 큐에 들어가게 됩니다.
재사용 큐에서 새로운 데이터로 업데이트된 셀이 사용자가 스크롤하여 보이는 셀의 위치에 재사용됩니다.
따라서 재사용 셀 개념은 메모리 사용을 줄이고, 애플리케이션의 성능을 개선하는 데 중요한 역할
 
 */



/*
 
 "큐(queue)"는 데이터를 저장하는 자료 구조 중 하나로, 데이터가 들어온 순서대로 처리됩니다. 큐는 FIFO(first-in, first-out) 원칙을 따릅니다. 즉, 가장 먼저 저장된 데이터가 가장 먼저 처리되는 구조입니다.
 
 */
