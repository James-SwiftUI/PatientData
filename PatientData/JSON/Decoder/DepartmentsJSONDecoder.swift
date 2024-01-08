import Foundation

struct DepartmentsResponse: Codable{
    let name: String
    let icon: String
}


struct DepartmentsJSONDecoder{
    
    enum DecodeError: Error{
        case fileNotFound
        case dataDecoding(Error)
    }
    
    static func decode(from fileName: String) throws -> [DepartmentsResponse]{
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else{
            throw DecodeError.fileNotFound
        }
        
        do{
            let data = try Data(contentsOf: url)
            let patients = try JSONDecoder().decode([DepartmentsResponse].self, from: data)
            return patients
        }catch{
            throw DecodeError.dataDecoding(error)
        }
        
       
             
        
    }
}
