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
            self.contacts = contacts
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
