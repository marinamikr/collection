//
//  ViewController.swift
//  collection
//
//  Created by 原田摩利奈 on 2/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var items: [String] = ["test","test","test","test","test","test","test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress))
        self.view.addGestureRecognizer(longPressGesture)
    }
  
//こっちが正しい方
//    @objc func onLongPress(gesture: UILongPressGestureRecognizer) {
//          if gesture.state == .ended {
//              let position = gesture.location(in: collectionView)
//              if let indexPath = collectionView.indexPathForItem(at: position) {
//                  let alertController = UIAlertController(title: "削除", message: "これを削除しますか？", preferredStyle: .alert)
//                  let yesAction = UIAlertAction(title: "削除", style: .destructive) { [self] _ in
//                      items.remove(at: indexPath.item)
//                      collectionView.deleteItems(at: [indexPath])
//                      collectionView.reloadData()
//                  }
//                  let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)
//                  alertController.addAction(yesAction)
//                  alertController.addAction(cancelAction)
//                  self.present(alertController, animated: true
//                  )
//              }
//          }
//      }
    
    //動かなかった方(今は動く、、)
    @objc func onLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            let position = gesture.location(in: collectionView)
            if let indexPath = collectionView.indexPathForItem(at: position) {
                let alert: UIAlertController = UIAlertController(title: "保存", message:"メモの保存が完了しました。", preferredStyle: .alert)
                  
                  alert.addAction(
                      UIAlertAction(
                          title: "OK",
                          style: .default,
                          handler: { action in
                              //ボタンが押された時の動作
                              self.navigationController?.popViewController(animated: true)
                          }
                      )
                  )
                
                present(alert, animated: true, completion: nil)
                
                items.remove(at: indexPath.item)
                collectionView.deleteItems(at: [indexPath])
                collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
