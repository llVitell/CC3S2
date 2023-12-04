class User {
    constructor(username, password){
        this.username = username
        this.password = password
    }

    checkPassword() {
        return function() {
          return this.password === password ? true : false  
        };
    } 
}