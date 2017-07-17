//
//  ImagesViewController.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

class GIImagesViewController: GIBaseViewController {

    // MARK: - Properties
    private  var imagesArrayValue   : [GIImageViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    internal var imagesArray        : [GIImageViewModel]? {
        set {
            if newValue == nil {
                imagesArrayValue = nil
                return
            }
            guard let images = imagesArrayValue else {
                imagesArrayValue = newValue
                return
            }
            if images.count > 0 {
                if let value = newValue {
                    imagesArrayValue! += value
                }
            }
        }
        get {
            return imagesArrayValue
        }
    }
    internal var currentPage        : Int = 1 {
        didSet {
            print(currentPage)
            loadDataWithSearchText(searchText: nil)
        }
    }
    internal var isSearching        : Bool = false
    
    // MARK: - Outlets
    @IBOutlet weak var tableView    : UITableView!
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadDataWithSearchText(searchText: nil)
    }


    //MARK:- Private Methods
    private func setupView() {
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = UITableViewConstants.estimatedRowHeight
    }
    
    private func loadDataWithSearchText(searchText: String?) {
        MBProgressHUD.showAdded(to: view, animated: true)
        GIImageStore.getImagesInPage(page: currentPage, searchPhrase: searchText, success: {[weak self] (modelArray) in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.imagesArray = modelArray as? [GIImageViewModel]
        }) {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)
        }
    }
    
}
