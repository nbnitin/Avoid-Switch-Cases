//
//  ViewController.swift
//  TableViewWithoutSwiftCaseWithDifferentCell
//
//  Created by Nitin Bhatia on 21/07/23.
//

import UIKit


enum CustomSectionsType {
    case type1 ([String])
    case type2([Int])
    case type3([Double])
    case type4([Bool])
}

class ViewController: UIViewController {

    @IBOutlet weak var tblData: UITableView!
    
    var cellsControllers: [CellController] = []
    var sections: [CustomSectionsType] = [
        .type1(["One"]),
        .type2([1,2]),
        .type3([1.2,2.2,3.2]),
        .type4([true, true, false, false])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTableView()
        setupTableView(sections: sections)
    }
    
    func initTableView() {
        tblData.dataSource = self
        tblData.delegate = self
        tblData.estimatedRowHeight = 50
    }
    
    func setupTableView(sections: [CustomSectionsType]) {
        sections.forEach({
            switch $0 {
            case .type1(let data):
                Type1CellController.register(tblData)
                cellsControllers.append(Type1CellController(data: data, delegate: self))
            case .type2(let data):
                Type2CellController.register(tblData)
                cellsControllers.append(Type2CellController(data: data, delegate: self))
            case .type3(let data):
                Type3CellController.register(tblData)
                cellsControllers.append(Type3CellController(data: data, delegate: self))
            case .type4(let data):
                Type4CellController.register(tblData)
                cellsControllers.append(Type4CellController(data: data, delegate: self))
            default:
                break
            }
        })
    }


}

// MARK: - UICollectionViewDelegate

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsControllers[section].tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellsControllers[indexPath.section].tableView(tableView, cellforrowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellsControllers[indexPath.section].tableView(tableView, didSelectrowAt: indexPath)
    }
}

extension ViewController: CellControllerSelected {
    func didCellControllerSelected(type: CustomSectionsType, indexPath: IndexPath) {
        switch type {
        case .type1(let data):
            print(data.first!)
        case .type2(let data):
            print(data.first!)
        case .type3(let data):
            print(data.first!)
        case .type4(let data):
            print(data.first!)
        default:
            break
        }
        print(type, indexPath)
        
        print((cellsControllers[indexPath.section] as? Type1CellController)?.data[indexPath.row])
    }
}
