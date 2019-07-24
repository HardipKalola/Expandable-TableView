//
//  ViewController.swift
//  Expandable TableView
//
//  Created by sotsys024 on 24/07/19.
//  Copyright © 2019 sotsys024. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var isExpande = false
    var isExpandeMore = false

    var selectedIndexPath: IndexPath?
    var arrBase = [["","",""], ["","","","",""], [""], ["",""]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrBase.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isExpande == true && section == selectedIndexPath?.section {
            if isExpandeMore == true  && section == selectedIndexPath?.section{
                return 5
            }
            return 2
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Base", for: indexPath)
        if isExpande == true && indexPath.row > 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Expanded", for: indexPath)
            if indexPath.row > 1{
                cell = tableView.dequeueReusableCell(withIdentifier: "ExpandedMore", for: indexPath)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.reuseIdentifier == "Base"{
            isExpandeMore = false
            if isExpande == true {
                isExpande = false
                tableView.reloadSections(IndexSet(arrayLiteral: selectedIndexPath!.section), with: .fade)
            }
            isExpande = !isExpande
            selectedIndexPath = indexPath
            tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
        }
        else if cell?.reuseIdentifier == "Expanded"{
            if isExpandeMore == false {
                isExpandeMore = true
                tableView.reloadSections(IndexSet(arrayLiteral: selectedIndexPath!.section), with: .fade)
                return
            }else{
                isExpandeMore = false
                tableView.reloadSections(IndexSet(arrayLiteral: selectedIndexPath!.section), with: .fade)
                return
            }
        }
      
        
//        if isExpande == true {
//            isExpande = false
//            tableView.reloadSections(IndexSet(arrayLiteral: selectedIndexPath!.section), with: .fade)
//            return
//        }
//        isExpande = !isExpande
//        selectedIndexPath = indexPath
//        tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
    }
    
}

