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
    func constructNormalCellForTableView(tableView: UITableView,
                                         atIndexPath indexPath: IndexPath) -> GIGettyTableViewCell {
        let cell: GIGettyTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.gettyCellIdentifier) as? GIGettyTableViewCell
        
        let imageModel = searchController.isActive ? imagesSearchResults?[indexPath.row] : imagesArray?[indexPath.row]
        
        cell?.customizeCellWithModel(gettyImage: imageModel, completion: {
            tableView.beginUpdates()
            tableView.endUpdates()
        })
        return cell!
    }
    
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return imagesSearchResults?.count ?? 0
        }
        return imagesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructNormalCellForTableView(tableView:tableView, atIndexPath:indexPath)
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewConstants.estimatedRowHeight
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        let modelArray = searchController.isActive ? imagesSearchResults : imagesArray
        
        if let images = modelArray {
            if indexPath.row == images.count - 1 {
                currentPage += 1
            }
        }
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let modelArray = searchController.isActive ? imagesSearchResults : imagesArray
        showMessageWithModel(model: modelArray?[indexPath.row])
    }
    
    
}
