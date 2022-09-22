//
//  ShowDataSource.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 23/09/22.
//

import UIKit
import SDWebImage

class ShowDataSource: NSObject {
    //MARK: Variables
    var itemDetails: ShowDataModel?
    var pageNumber = 1
    typealias PaginationSucessBlock = (_ isFetchData:Bool)->Void
    var competion:PaginationSucessBlock!
    let spinner = UIActivityIndicatorView(style: .medium)
}

//MARK: UITableViewDatasource and delegate 
extension ShowDataSource : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDetails?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier) as! ShowDataCell
        let objData = itemDetails?.items?[indexPath.row]
        cell.selectionStyle = .none
        cell.imageProfile.sd_setImage(with: URL.init(string: objData?.owner?.profileImage ?? ""))
        cell.lblName.text = objData?.owner?.displayName?.capitalized
        cell.lblTitle.text = objData?.title
        cell.lbllastActive.text = "active \(AppManager.shared.convertTimeIntoTimeAgo(objData?.lastActivityDate ?? 0))"
        cell.clickEvent = { buttonClicked in
            if buttonClicked {
                let application = UIApplication.shared
                let url = URL.init(string: objData?.owner?.link ?? "")!
                if application.canOpenURL(url) {
                    application.open(url)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (itemDetails?.items?.count ?? 0) - 1 {
            spinner.startAnimating()
            if competion != nil {
                self.competion(true)
            }
        }
    }
    
}
