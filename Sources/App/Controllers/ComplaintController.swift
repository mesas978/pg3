import Fluent
import Vapor

struct ComplaintController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let complaints = routes.grouped("complaints")
        complaints.get(use: index)
        complaints.post(use: create)
        complaints.group(":complaintID") { todo in
            complaints.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Complaint]> {
        return Complaint.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Complaint> {
        let complaint = try req.content.decode(Complaint.self)
        return complaint.save(on: req.db).map { complaint }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Complaint.find(req.parameters.get("ComplaintID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
