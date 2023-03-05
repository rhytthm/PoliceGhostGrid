//
//  ViewController.swift
//  CollectionView
//
//  Created by Rhytthm Mahajan on 07/02/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var dataList: [String?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var prevPolicePos: Int?
    var prevGhostPos: Int?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let cellItem = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            reset()
            cellItem.configure(with: dataList[indexPath.row])
            cell = cellItem
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if( dataList[indexPath.row] == ""){
            if let prevGhostPos = prevGhostPos , let prevPolicePos = prevPolicePos {
                dataList[prevGhostPos] = ""
                dataList[prevPolicePos] = ""
            }
            dataList[indexPath.row] = "👮‍♂️"
            prevPolicePos  = indexPath.row
            prevGhostPos = setupGhost(pos: indexPath.row)
            if let prevGhostPos =  prevGhostPos{
                dataList[prevGhostPos] = "👻"
                print("👻 -----------> \(prevGhostPos)")
            }
            print("👮‍♂️ -----------> \(indexPath.row)")
           
        }else{
            dataList[indexPath.row] = ""
        }
        self.collectionView.reloadData()

    }
    
    func setupGhost(pos:Int) -> Int{
        var ghostPos: Int = generateRandom()
        while pos == ghostPos{
            ghostPos = generateRandom()
        }
        return ghostPos
    }
    
    func generateRandom() -> Int {
        return Int.random(in: 0..<25)
    }
    
    func reset(){
            for _ in 0...24{
                dataList.append("")
            }
        
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        for i in 0...24{
            dataList[i] = ""
        }
        collectionView.reloadData()
    }
    
}

