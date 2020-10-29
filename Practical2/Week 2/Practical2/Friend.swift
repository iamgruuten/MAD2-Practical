import Foundation

class Friend{
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
    
    var description: String = ""
    
    init(firstname: String, lastname: String, age:Int, description:String){
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
        self.description = description
    }

    
}
