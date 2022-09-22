//
//  ShowDataViewModel.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 22/09/22.
//

import UIKit

class ShowDataViewModel: NSObject {

    //MARK: Variables
    var dataSource = ShowDataSource()
    
    //MARK: Method to fetch data from server
    func getDataFromServer(_ urlString:String, _ completion: @escaping (_ success: Bool,_ itemsData: [Item]?)-> Void) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                AppManager.shared.showAlertMessage(Constant.error, error?.localizedDescription ?? Constant.somethingWrong)
                completion(false,nil)
              return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                AppManager.shared.showAlertMessage(Constant.error, Constant.serverError)
                completion(false,nil)
               return
             }
            
            guard let data = data else {
                AppManager.shared.showAlertMessage(Constant.error, Constant.noData)
                completion(false,nil)
                return
            }
            //For debug purpose
            if let returnData = String(data: data, encoding: .utf8) {
               print(returnData)
            }
            //Parsing data
            do {
                let responseData = try JSONDecoder().decode(ShowDataModel.self, from: data )
                if self.dataSource.pageNumber == 1 {
                    self.dataSource.itemDetails = responseData
                }else{
                    for obj in responseData.items ?? []{
                        self.dataSource.itemDetails?.items?.append(obj)
                    }
                }
                
                completion(true,responseData.items)
            }catch let error {
                completion(false,nil)
                print(error)
            }
        })

        task.resume()
    }
    
    
    func handlePagination(_ competion:@escaping (_ sucesss:Bool)-> Void){
        dataSource.competion = { isMorefetch in
            if isMorefetch {
                self.dataSource.pageNumber += 1
                self.getDataFromServer(GAPIConstant.getDataApiUrl(self.dataSource.pageNumber )) { success, itemsData in
                    DispatchQueue.main.async {
                        if success {
                            competion(true)
                        }else{
                            self.dataSource.pageNumber -= 1
                        }
                    }
                }
            }
        }
    }
}
