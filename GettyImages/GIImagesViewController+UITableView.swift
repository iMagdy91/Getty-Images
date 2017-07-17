//
//  GIImagesViewController+UITableView.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/17/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

extension GIImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell Construction Methods
    func constructNormalCellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> GIGettyTableViewCell {
        let cell: GIGettyTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.gettyCellIdentifier) as? GIGettyTableViewCell
        cell?.customizeCellWithModel(gettyImage: imagesArray?[indexPath.row], completion: { 
            DispatchQueue.main.async(execute: { _ in
                tableView.beginUpdates()
                tableView.endUpdates()
            })

        })
        return cell!
    }
    
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructNormalCellForTableView(tableView:tableView,  atIndexPath:indexPath)
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewConstants.estimatedRowHeight
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let images = imagesArray {
            if indexPath.row == images.count - 1 {
                currentPage += 1
            }
        }
        
    }
   
    
}
