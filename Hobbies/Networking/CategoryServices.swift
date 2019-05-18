//
//  CategoriesServices.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import ObjectMapper

public class CategoryServices: BaseNetworkingServices
{
    enum endpoints: String {
        case categories = "categories.json"
    }
    
    func getAllCategories(completionHandler: @escaping (_ result: Array<CategoryModel>?, AppError?) -> Void)
    {
        
        self.request(endpoint: endpoints.categories.rawValue, method: .get) { [weak self] (result) in
            switch result{
            case .success(let cateogryObjects):
                
                if let categoryArray = cateogryObjects as? Array<Dictionary<String, Any>> {
                    var categories = Array<CategoryModel>()
                    for categoryObject in categoryArray {
                        if let newCategory = CategoryModel(JSON: categoryObject) {
                            categories.append(newCategory)
                        }
                    }
                    completionHandler(categories, nil)
                    return
                }
                completionHandler(nil, AppError.createNetworkingError(WithType: .jsonParsing))
                return
            case .failure(let error):
                completionHandler(nil, error as? AppError)
                return
            }
        }
    }
}

extension CategoryServices
{
    func convert(categoryObjects objects: Any) -> Array<CategoryModel>?
    {
        guard let categoryArray = objects as? Array<Dictionary<String, Any>> else { return nil }
        var categories = Array<CategoryModel>()
        for categoryObject in categoryArray {
            if let newCategory = CategoryModel(JSON: categoryObject) {
                categories.append(newCategory)
            }
        }
        return categories
    }
}
