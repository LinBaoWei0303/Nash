//
//  FlowTimeData.swift
//  Nash
//
//  Created by ntust04 on 2020/6/9.
//  Copyright © 2020 ntust04. All rights reserved.
//

import Foundation
import SQLite

class FlowTImeWorker : NSObject {
    
    func createTable() {
        do {
            //
            let db = try Connection("db.sqlite3")

            //
            let timeSectionTable = Table("timeSection")
            let id = Expression<Int64>("id")
            let startTime = Expression<Int64>("startTime")
            let endTime = Expression<Int64>("endTime")

            try db.run(timeSectionTable.create { t in
                t.column(id, primaryKey: true)
                t.column(startTime)
                t.column(endTime)
            })
            
        } catch  {
            
        }
    }
    
    func addTimeSectime( start : Int64, end : Int64  ) {
        
        do {
            //
            let db = try Connection("db.sqlite3")

            //
            let timeSectionTable = Table("timeSection")
            
            let startTime = Expression<Int64>("startTime")
            let endTime = Expression<Int64>("endTime")
            //
            
            
            let insert = timeSectionTable.insert(startTime <- start, endTime <- end)
            _ = try db.run(insert)

        } catch  {
            
        }
        
    }
    
    func selectAll() {
        
        do {
            //
            let db = try Connection("db.sqlite3")

            //
            let timeSectionTable = Table("timeSection")
            
            let startTime = Expression<Int64>("startTime")
            let endTime = Expression<Int64>("endTime")
            
            if let sections = try? db.prepare(timeSectionTable) {
                for section in sections {
                    print("\tid:\(section[startTime]), name: \(section[endTime])")
                }
            }

        } catch  {
            
        }
        
        
        
        
    }
    
    
}
