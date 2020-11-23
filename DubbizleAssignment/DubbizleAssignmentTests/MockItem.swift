//
//  MockItem.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation
@testable import DubbizleAssignment

struct MockItem {
    
    static func getItem() -> Item {
        
        let createdAt = "2019-02-24 04:04:17.566515"
        let price = "AED 5"
        let name = "Test item"
        let image_ids = ["9355183956e3445e89735d877b798689"]
        let uid = "adafhfewrerrew"
        let imageUrls = ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A42YMAVTTM&Signature=Wfi5dMzMul%2B8UxRrtKpnsV%2Fulgg%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEEIaCXVzLWVhc3QtMSJHMEUCIQCnGXgTjIUXoItFI8hNEsfjEsQdaIPCDMdIk5F2IRq9OwIgdV2zpC3PmY2SI1vMEd%2BEC74HR1cQZu0%2BqsVRICql%2F60q1wEIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDEmrjvFTDSBzuxHHQSqrAS%2F9VDJM9mqD75qc6hNH471B1%2BUooo47zQGHw9%2FqJfVEMAiE4swIpCcuuSHNCxdt5sgNliz49viGmFCcZ9w7H3yFP%2BAo6rUUDOPQlG0wvQGKMIpy%2FiqWLDumjgq%2FBSqsRQSCRQj8B3%2FFiC1JeYwcoyDzTxlt4wm9uWMVTq%2F7%2FWnqkFEM5au465nt%2BkOoCpZn8qqMTRTYzZs%2FWdBTeieDPzqYJKGTRZwnS7dsezDz%2Fe39BTrgAZUgVflZirIUsuej7gCUVw20VQ5e8px9GuJrUpLB2dWpnaFTHdlxZb%2FJy%2F2SMMlVyZQeRr%2FbjWbFKYoLlEx8rdfpiuiNq83S3lzbwCST1RUL5WtcDreenyhkbxZD9k92cagZK7qIMYmYrV3U4qw4SQM93frnWLhgeBez2Z4UTbxGrI8%2Bf0oBY%2FxVztR8ybkf12Gt5O%2FDTJL%2BbVjHk32mt5%2F9HY3E5ol0a8U7qVbBE6l%2FvATe2cSKny96lj20naVTYjuoi3EXNL9j3FVC7khNph906ZpImOxg7S3dETCE%2F0Vx&Expires=1606126854"]
        
        let imageUrlsThumbnails = ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A42YMAVTTM&Signature=MVp53mmTu6qZnp%2F9cF7nlMPu7ng%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEEIaCXVzLWVhc3QtMSJHMEUCIQCnGXgTjIUXoItFI8hNEsfjEsQdaIPCDMdIk5F2IRq9OwIgdV2zpC3PmY2SI1vMEd%2BEC74HR1cQZu0%2BqsVRICql%2F60q1wEIuv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDEmrjvFTDSBzuxHHQSqrAS%2F9VDJM9mqD75qc6hNH471B1%2BUooo47zQGHw9%2FqJfVEMAiE4swIpCcuuSHNCxdt5sgNliz49viGmFCcZ9w7H3yFP%2BAo6rUUDOPQlG0wvQGKMIpy%2FiqWLDumjgq%2FBSqsRQSCRQj8B3%2FFiC1JeYwcoyDzTxlt4wm9uWMVTq%2F7%2FWnqkFEM5au465nt%2BkOoCpZn8qqMTRTYzZs%2FWdBTeieDPzqYJKGTRZwnS7dsezDz%2Fe39BTrgAZUgVflZirIUsuej7gCUVw20VQ5e8px9GuJrUpLB2dWpnaFTHdlxZb%2FJy%2F2SMMlVyZQeRr%2FbjWbFKYoLlEx8rdfpiuiNq83S3lzbwCST1RUL5WtcDreenyhkbxZD9k92cagZK7qIMYmYrV3U4qw4SQM93frnWLhgeBez2Z4UTbxGrI8%2Bf0oBY%2FxVztR8ybkf12Gt5O%2FDTJL%2BbVjHk32mt5%2F9HY3E5ol0a8U7qVbBE6l%2FvATe2cSKny96lj20naVTYjuoi3EXNL9j3FVC7khNph906ZpImOxg7S3dETCE%2F0Vx&Expires=1606126854"]
        let item = Item(created_at: createdAt,
             price: price,
             name: name,
             uid: uid,
             image_ids: image_ids,
             image_urls: imageUrls,
             image_urls_thumbnails: imageUrlsThumbnails)
        return item
    }
}
