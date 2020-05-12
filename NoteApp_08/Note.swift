//
//  Note.swift
//  NoteApp_08
//
//  Created by 林旻萱 on 2020/5/11.
//  Copyright © 2020 Hsuan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Note : NSManagedObject{
//class Note : Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.noteID == rhs.noteID
    }
    
    @NSManaged var noteID: String
    @NSManaged var text: String?
//    var image: UIImage?
    @NSManaged var imageName: String?
    
    override func awakeFromInsert() {
//    init() {
        self.noteID = UUID().uuidString
    }
    
    
    func image()->UIImage? {
        if let fileName = self.imageName{
            let homeUrl = URL(fileURLWithPath: NSHomeDirectory())
            let documentUrl = homeUrl.appendingPathComponent("Documents")
            let fileUrl = documentUrl.appendingPathComponent(fileName)
            return UIImage(contentsOfFile: fileUrl.path)
        }
        return nil
    }
    
}
