import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, worldqqq!"
    }

    try app.register(collection: TodoController())
    
    /* this worked in Vapor 3:
      let articleController = ArticleController()
      router.get("articles", use: articleController.index)
      router.post("articles", use: articleController.create)
      router.delete("article", Todo.parameter, use: todoController.delete)
   */
    app.get("complaint") { req in
        Complaint.query(on: req.db).all()
    }

    app.post("complaint") { req -> EventLoopFuture<Complaint> in
        let complaint = try req.content.decode(Complaint.self)
        if let id = complaint.id {
            print("60p \(id)") // Optional(6005)
        }
        return complaint.save(on: req.db)
            .map { complaint }
    }
    /*
     func create(req: Request) throws -> EventLoopFuture<Todo> {
         let todo = try req.content.decode(Todo.self)
         return todo.save(on: req.db).map { todo }
     }
     */
    
}
