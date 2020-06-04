import Fluent
import Vapor


final class Complaint: Model, Content {
    
    static let schema = "cw_complaint5"
    /*
    @ID(key: .id)
    var id: UUID?
 */
    // https://stackoverflow.com/questions/62161649/swift-5-2-xcode-11-4-vapor-4-0-0-how-should-i-code-the-pk-in-my-model#comment109952952_62161649
    
    @ID(custom: "id", generatedBy: .database) var id: Int?
    //@ID(key: "id") var id: Int?
    
     //var id: Int? worked in Vapor 3
    
    @Field(key: "issue_description")
    var issue_description: String
    
    @Field(key: "document_number")
    var document_number: Int
    
    @Field(key: "api_state_code")
    var api_state_code: Int
    
    @Field(key: "api_county_code")
    var api_county_code: Int
    
    @Field(key: "api_sequence_number")
    var api_sequence_number: Int

    @Field(key: "section")
    var section: Int
    
    @Field(key: "city_id")
    var city_id: Int
    
    @Field(key: "county_id")
    var county_id: Int
    
    @Field(key: "operator_id")
    var operator_id: Int
    
    @Field(key: "updated")
    var updated: Date


    init() { }
    
    /*
    init(id: UUID? = nil, title: String) {
         self.id = id
         self.title = title
     }
    */
    init(id: Int, issue_description: String, document_number: Int,
         api_state_code: Int, api_county_code: Int, api_sequence_number: Int,
         section: Int, updated: Date
    ) {
        print("50p")
        self.id = id
        self.issue_description = issue_description
        self.document_number = document_number
        self.api_state_code = api_state_code
        self.api_county_code = api_county_code
        self.api_sequence_number = api_sequence_number
        self.section = section
        self.updated = updated
    }
}
