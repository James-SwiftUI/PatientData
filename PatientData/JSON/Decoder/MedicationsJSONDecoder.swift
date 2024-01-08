//
//  MedicationsJSONDecoder.swift
//  PatientApp
//
//  Created by James on 20/12/2023.
//

import Foundation


struct MedicationsResponse: Codable{
    let name: String
    let dosage: String
}


struct MedicationsJSONDecoder{
    
    enum DecodeError: Error{
        case fileNotFound
        case dataDecoding(Error)
    }
    
    static func decode(from fileName: String) throws -> [MedicationsResponse]{
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else{
            throw DecodeError.fileNotFound
        }
        
        do{
            let data = try Data(contentsOf: url)
            let medications = try JSONDecoder().decode([MedicationsResponse].self, from: data)
            return medications
        }catch{
            throw DecodeError.dataDecoding(error)
        }
        
       
             
        
    }
}
