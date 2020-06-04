import Fluent

struct CreateComplaint: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("cw_complaint5")
            .id()
            .field("issue_description", .string)
            .create()
    }

    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("issue_description").delete()
    }
}
