//
//  DetailViewModel.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/19/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import Foundation

struct DetailToListModel
{
    struct Section
    {
        var items: [Item]
    }
    
    
    enum Item
    {
        case photo(Photo)
        case titleAndDesc(Title)
        case contactInformation(ContactInformation)
        case addresses(Addresses)
        case businessHours(BusinessHours)
    }
    
    struct Photo
    {
        let urlString: String
    }
    
    struct Title
    {
        let title: String
        let description: String?
    }
    
    struct ContactInformation
    {
        let items: [ContactInfoModel]
    }
    
    struct Addresses
    {
        let items: [AddressModel]
    }
    
    struct BusinessHours
    {
        let items: [BusinessHourModel]
    }
    
    var sections: [Section]
    
    
    static var empty: DetailToListModel {
        return DetailToListModel(sections: [])
        
    }
    
}



class DetailViewModel: NSObject
{
    var detailObject: ListDetailModelProtocol! {
        didSet {
            
        }
    }
    var detailToListModel = DetailToListModel.empty

    func numberOfSections() -> Int {
        return detailToListModel.sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return detailToListModel.sections[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> DetailToListModel.Item? {
        return detailToListModel.sections[indexPath.section].items[indexPath.item]
        
    }

    func createDetailArray(detailModelProtocol: ListDetailModelProtocol) -> DetailToListModel
    {
        var responseModel = DetailToListModel.empty
        
        if let title = detailModelProtocol.title {
            let item = DetailToListModel.Item.titleAndDesc(DetailToListModel.Title(title: title, description: detailModelProtocol.description))
            let section = DetailToListModel.Section(items: [item])

            responseModel.sections.append(section)
        }
        
        if let photo = detailModelProtocol.photo {
            let item = DetailToListModel.Item.photo(DetailToListModel.Photo(urlString: photo))
            let section = DetailToListModel.Section(items: [item])
            
            responseModel.sections.append(section)
        }
        
        if let contacts = detailModelProtocol.contactInfo {
            let items = contacts.map { (contact) -> DetailToListModel.Item in
                return DetailToListModel.Item.contactInformation(DetailToListModel.ContactInformation(items: contacts))
            }
            let section = DetailToListModel.Section(items: items)
            
            responseModel.sections.append(section)
        }
        
        if let addresses = detailModelProtocol.addresses {
            let items = addresses.map { (address) -> DetailToListModel.Item in
                return DetailToListModel.Item.addresses(DetailToListModel.Addresses(items: addresses))
            }
            let section = DetailToListModel.Section(items: items)
            
            responseModel.sections.append(section)
        }
        
        if let businessHours = detailModelProtocol.businessHours {
            let items = businessHours.map { (businessHour) -> DetailToListModel.Item in
                return DetailToListModel.Item.businessHours(DetailToListModel.BusinessHours(items: businessHours))
            }
            let section = DetailToListModel.Section(items: items)
            responseModel.sections.append(section)
        }
        
        return responseModel
    }
}
