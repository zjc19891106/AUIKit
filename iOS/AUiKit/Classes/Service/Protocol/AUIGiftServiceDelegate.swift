//
//  AUIGiftServiceDelegate.swift
//  AUiKit
//
//  Created by 朱继超 on 2023/5/18.
//

import Foundation


public class AUIGiftEntity:NSObject,NSMutableCopying {
     
 
    public func mutableCopy(with zone: NSZone? = nil) -> Any {
        let model = AUIGiftEntity()
        model.gift_id = self.gift_id
        model.gift_count = self.gift_count
        model.gift_price = self.gift_price
        model.gift_name = self.gift_name
        model.selected = self.selected
        model.sendUser = self.sendUser
        return model
    }

    var gift_id: String? = ""
    var gift_name: String? = ""
    var gift_price: String? = ""
    var gift_count: String? = "0"
    
    var selected = false
    
    var sendUser: AUiUserThumbnailInfo?
 
    /// Description 开发者可以上传服务器一个匹配礼物id的特效  特效名称为礼物的id  sdk会进入房间时拉取礼物资源并下载对应礼物id的特效，如果收到的礼物这个值为true 则会找到对应的特效全屏播放加广播，礼物资源以及特效资源下载服务端可做一个web页面供用户使用，每个app启动后加载场景之前预先去下载礼物资源缓存到磁盘供UIKit取用
    var hasEffect: Bool?
     
    override public required init() {}
}
 
 
 
 
public class AUIGiftTabEntity: NSObject {
    
    /// Description 对应哪个tab index
    var tabId: String?
    
    /// Description 显示名称
    var displayName: String?
    
    /// Description tab下礼物数据
    var gifts: [AUIGiftEntity]?
     
 
}
 
 
 
public protocol AUIGiftsManagerServiceDelegate: NSObjectProtocol {
 
    /// Description 礼物列表
 
    /// - Parameters:
 
    ///   - roomId: 房间id
 
    ///   - completion: 回调包含礼物数组
 
    func giftsFromService(roomId: String,completion: @escaping ([AUIGiftTabEntity],Error?) -> Void)
     
 
    /// Description 发送礼物
 
    /// - Parameters:
 
    ///   - gift: 礼物模型
 
    ///   - completion: 回调
 
    func sendGift(gift: AUIGiftEntity,completion: @escaping (Error?) -> Void)
 
}
 
 
 
 
public protocol AUIGiftsManagerRespDelegate: NSObjectProtocol {
 
     
    /// Description 接收到礼物
 
    /// - Parameter gift: 收到的礼物
 
    func receiveGift(gift: AUIGiftEntity)
 
}
