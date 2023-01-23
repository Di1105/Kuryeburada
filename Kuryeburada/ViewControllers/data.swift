//
//  data.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 23.01.2023.
//

import Foundation
import UIKit

struct DataStruct {
    
    var itemsSegment = ["From Me","To Me"]
    var collectionTopArray = ["All","Pending","On Process","Delivery"]
    var imageArray = [UIImage(named: "wal"),UIImage(named: "pay"), UIImage(named: "pay2"),UIImage(named: "pencil"),UIImage(named: "wal"),UIImage(named: "pay"), UIImage(named: "pay2"),UIImage(named: "pencil"),UIImage(named: "wal"),UIImage(named: "pay"), UIImage(named: "pay2"),UIImage(named: "pencil")]
    var InboxPics = [UIImage(named: "pencil"),UIImage(named: "wal"),UIImage(named: "pay2"),UIImage(named: "pay"),UIImage(named: "pencil"),UIImage(named: "wal"),UIImage(named: "pay2"),UIImage(named: "pay"),UIImage(named: "pencil"),UIImage(named: "wal"),UIImage(named: "pay2"),UIImage(named: "pay")]
    
    var transitCodeArray = ["SK2324555","SK1114555","SK4567843","SK9834561","SK2324555","SK1114555","SK4567843","SK9834561","SK2324555","SK1114555","SK4567843","SK9834561"]
    
    var transitInfoArray = ["Package received","Package received","Package received","Package received","Package received","Package received","Package received","Package received","Package received","Package received","Package received","Package received"]
    
    var transitCase = ["Completed","Completed","Completed","Completed","Completed","Completed","Completed","Completed","Completed","Completed","Completed","Completed"]
    
    var headerTextArray = ["New Order Made!","Top Up Successful!","Payment Successful!", "E-Wallet Connected!","New Order Made!","Top Up Successful!","Payment Successful!", "E-Wallet Connected!","New Order Made!","Top Up Successful!","Payment Successful!", "E-Wallet Connected!"]
    
    var infoTextArray = ["You have creates a new shipping order","You successfully top up your e-wallet for 600$","Shipping payment of $40 succesfully made","You have connected the e-wallet wit KuryeBurada","You have creates a new shipping order","You successfully top up your e-wallet for 600$","Shipping payment of $40 succesfully made","You have connected the e-wallet wit KuryeBurada","You have creates a new shipping order","You successfully top up your e-wallet for 600$","Shipping payment of $40 succesfully made","You have connected the e-wallet wit KuryeBurada"]
    
    var itemsSegmentInbox = ["Chats","Calls"]
    
    var InboxTel = ["+1 234 3444565","+1 234 3567898","+1 456 2356787","+1 234 3444565","+1 234 3567898","+1 456 2356787","+1 234 3444565","+1 234 3567898","+1 456 2356787","+1 234 3444565","+1 234 3567898","+1 456 2356787"]
    
    var InboxNames = ["Angela Lina James","Steven Curry","Tom Park","Timy Hankson","Angela Lina James","Steven Curry","Tom Park","Timy Hankson","Angela Lina James","Steven Curry","Tom Park","Timy Hankson"]
    
    var Inbox2Names = ["Tom Park","Timy Hankson","Angela Lina James","Steven Curry","Tom Park","Timy Hankson","Angela Lina James","Steven Curry","Tom Park","Timy Hankson","Angela Lina James","Steven Curry"]
    
    var dates = ["12:55","14:00","Yesterday","Yesterday", "June 14, 2022", "June 28,2022","June 28,2022","June 28,2022","June 28,2022","June 28,2022","June 28,2022","June 28,2022"]
    
    var notifics = ["2","","","1","3","1","","","3","4","1",""]
    
    var InboxMsg = ["Hello, can you...","Thanks for the...","I need another...","Hey, i have...","Could you pls...","I do not sen...","Hello, can you...","Thanks for the...","I need another...","Hey, i have...","Could you pls...","I do not sen..."]
    
    var profilePics = [UIImage(named: "profile"),UIImage(named: "profile2"),UIImage(named: "profile1"),UIImage(named: "profile3"),UIImage(named: "profile"),UIImage(named: "profile2"),UIImage(named: "profile1"),UIImage(named: "profile3"),UIImage(named: "profile"),UIImage(named: "profile2"),UIImage(named: "profile1"),UIImage(named: "profile3")]
    var profilePics2 = [UIImage(named: "profile1"),UIImage(named: "profile2"),UIImage(named: "profile"),UIImage(named: "profile3"),UIImage(named: "profile1"),UIImage(named: "profile2"),UIImage(named: "profile"),UIImage(named: "profile3"),UIImage(named: "profile"),UIImage(named: "profile2"),UIImage(named: "profile1"),UIImage(named: "profile3")]
}
