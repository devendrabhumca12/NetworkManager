//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Devendra Agnihotri on 12/01/23.
//

import SwiftUI
import Network
// An enum to handle the network status
public enum NetworkStatus: String {
    case connected
    case disconnected
}
// An enum to check the network type
public enum NetworkType: String {
    case wifi
    case cellular
    case wiredEthernet
    case other
}

@available(iOS 13.0, *)
public class NetworkManager: ObservableObject {
    
    @Published public var isMonitoring = false
    @Published public var status: NetworkStatus = .disconnected
    @Published private var pathStatus = NWPath.Status.requiresConnection
    @Published public var isConnected = false
    
    var monitor: NWPathMonitor?
    
    private var isStatusSatisfied: Bool {
        guard let monitor = monitor else { return false }
        return monitor.currentPath.status == .satisfied
    }
    
    public var networkType: NetworkType? {
        guard let monitor = monitor else { return nil }
        let type = monitor.currentPath.availableInterfaces.filter {
            monitor.currentPath.usesInterfaceType($0.type) }.first?.type 
       return getNetworkType(interFaceType: type)
    }
    
    private var availableNetworkTypes: [NWInterface.InterfaceType]? {
        guard let monitor = monitor else { return nil }
        return monitor.currentPath.availableInterfaces.map { $0.type }
    }
    
    public init() {
        startMonitoring()
    }
    
    deinit {
        stopMonitoring()
    }
    
    public func startMonitoring() {
        guard !isMonitoring else { return }
        
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkStatus_Monitor")
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { path in
        //Monitor runs on a background thread so we need to publish it on the main thread.
            DispatchQueue.main.async {
                if self.pathStatus != path.status {
                    self.pathStatus = path.status
                    self.status = self.pathStatus == .satisfied ? .connected : .disconnected
                    self.isConnected = self.status == .connected ? true : false
                }
            }
        }
        isMonitoring = true
    }
    
    public func stopMonitoring() {
        guard isMonitoring, let monitor = monitor else { return }
        monitor.cancel()
        self.monitor = nil
        isMonitoring = false
    }
    
    private func getNetworkType(interFaceType: NWInterface.InterfaceType?)->NetworkType{
        switch interFaceType {
        case .wifi:
            return .wifi
        case .cellular:
            return .cellular
        case .wiredEthernet:
            return .wiredEthernet
        default:
            return .other
        }
    }
}
