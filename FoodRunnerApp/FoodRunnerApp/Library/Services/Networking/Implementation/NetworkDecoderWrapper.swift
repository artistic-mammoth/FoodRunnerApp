//
//  NetworkDecoderWrapper.swift
//  FoodRunnerApp
//
//  Created by Михайлов Александр on 08.10.2023.
//

import Foundation

final class NetworkDecoderWrapper<DataModel>: NetworkDecoder where DataModel: Codable {
    // MARK: - Private properties
    private let decoder: Converter
    
    // MARK: - Init
    init(decoder: Converter = ConverterFromJSON()) {
        self.decoder = decoder
    }
    
    // MARK: - NetworkDecoderProtocol
    func decode(from data: Data) -> DataModel? {
        decoder.decode(from: data)
    }
}
