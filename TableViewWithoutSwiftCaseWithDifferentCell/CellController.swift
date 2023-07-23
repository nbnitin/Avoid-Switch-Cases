//
//  CellController.swift
//  TableViewWithoutSwiftCaseWithDifferentCell
//
//  Created by Nitin Bhatia on 21/07/23.
//

import UIKit
protocol CellController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellforrowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, didSelectrowAt indexPath: IndexPath)
}

protocol CellControllerSelected {
    func didCellControllerSelected(type: CustomSectionsType, indexPath: IndexPath)
}


struct Type1CellController: CellController {
    let data: [String]
    var delegate: CellControllerSelected?
    
    init(data: [String], delegate: CellControllerSelected?) {
        self.data = data
        self.delegate = delegate
    }
    
    static func register(_ tableView: UITableView) {
        tableView.register(UINib(nibName: "Type1TableCell", bundle: nil), forCellReuseIdentifier: "Type1TableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellforrowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "Type1TableCell", for: indexPath) as! Type1TableCell
        cell.lblTitle.text = data[indexPath.row]
        return cell
    }
    
    func tableView( _ tableView: UITableView, didSelectrowAt indexPath: IndexPath) {
        print ("Type1")
        delegate?.didCellControllerSelected(type: .type1([data[indexPath.row]]), indexPath: indexPath)
    }
}

struct Type2CellController: CellController {
    let data: [Int]
    var delegate: CellControllerSelected?

    init(data: [Int], delegate: CellControllerSelected?) {
        self.data = data
        self.delegate = delegate
    }
    
    static func register( _ tableView: UITableView) {
        tableView.register(UINib(nibName:"Type2TableCell", bundle: nil), forCellReuseIdentifier: String (describing: Type2TableCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellforrowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Type2TableCell", for: indexPath) as! Type2TableCell
        cell.lblPersonName.text = "\(data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectrowAt indexPath: IndexPath) {
        print ("Type2")
        delegate?.didCellControllerSelected(type: .type2([data[indexPath.row]]), indexPath: indexPath)

    }
}

struct Type3CellController: CellController {
    let data: [Double]
    var delegate: CellControllerSelected?
    
    init(data: [Double], delegate: CellControllerSelected?) {
        self.data = data
        self.delegate = delegate
    }
    
    static func register( _ tableView: UITableView) {
        tableView.register(UINib(nibName:"Type3TableCell", bundle: nil), forCellReuseIdentifier: String (describing: Type3TableCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellforrowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Type3TableCell", for: indexPath) as! Type3TableCell
        cell.lblTitle.text = "\(data[indexPath.row])"
        cell.lblDes.text = "I am cell type 3"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectrowAt indexPath: IndexPath) {
        print ("Type3")
        delegate?.didCellControllerSelected(type: .type3([data[indexPath.row]]), indexPath: indexPath)

    }
}


struct Type4CellController: CellController {
    let data: [Bool]
    var delegate: CellControllerSelected?
    
    init(data: [Bool], delegate: CellControllerSelected?) {
        self.data = data
        self.delegate = delegate
    }
    
    static func register( _ tableView: UITableView) {
        tableView.register(UINib(nibName:"Type4TableCell", bundle: nil), forCellReuseIdentifier: String (describing: Type4TableCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellforrowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Type4TableCell", for: indexPath) as! Type4TableCell
        cell.lblValue.text = "\(data[indexPath.row])"
        cell.img.isHidden = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectrowAt indexPath: IndexPath) {
        print ("Type4")
        delegate?.didCellControllerSelected(type: .type4([data[indexPath.row]]), indexPath: indexPath)

    }
}
