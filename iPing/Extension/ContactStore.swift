//
//  ContactStore.swift
//  iPing
//
//  Created by kakao on 2020/05/27.
//  Copyright © 2020 changman. All rights reserved.
//

import Contacts
import SwiftUI
import os
import Combine

class ContactViewModel: ObservableObject {
    let store = ContactStore.shared
    @Published var searchString: String = ""
    @Published var result: [CNContact] = []
    private var disposables = Set<AnyCancellable>()
    init() {
        $searchString.debounce(for: .seconds(0.3), scheduler: RunLoop.main).sink { (searchStr) in
            self.result = self.store.contacts.filter {                         $0.name.hasPrefix(searchStr) && searchStr != ""
            }
        }.store(in: &disposables)
    }
}

class ContactStore: ObservableObject {
    static let shared: ContactStore = ContactStore()
    
    @Published var contacts: [CNContact] = []
    @Published var error: Error? = nil
    
    init() {
        fetch()
    }

    func fetch() {
        guard self.contacts.count == 0 else { return }
        os_log("Fetching contacts")
        do {
            let store = CNContactStore()
            let keysToFetch = [CNContactGivenNameKey as CNKeyDescriptor,
                               CNContactMiddleNameKey as CNKeyDescriptor,
                               CNContactFamilyNameKey as CNKeyDescriptor,
                               CNContactImageDataAvailableKey as CNKeyDescriptor,
                               CNContactImageDataKey as CNKeyDescriptor]
            os_log("Fetching contacts: now")
            let containerId = store.defaultContainerIdentifier()
            let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
            let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
            os_log("Fetching contacts: succesfull with count = %d", contacts.count)
            self.contacts = contacts.sorted(by: { (lhs, rhs) -> Bool in
                lhs.name > rhs.name
            })
        } catch {
            os_log("Fetching contacts: failed with %@", error.localizedDescription)
            self.error = error
        }
    }
}

extension CNContact: Identifiable {
    var name: String {
        return [givenName, middleName, familyName].filter{ $0.count > 0}.joined(separator: " ")
    }
}
