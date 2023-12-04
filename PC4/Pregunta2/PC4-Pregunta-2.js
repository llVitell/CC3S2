class Pokemon{
    constructor(hp, ataque, defensa){
        this.hp = hp
        this.ataque = ataque
        this.defensa = defensa
        this.movimiento = ""
        this.nivel = 1
        this.tipo = ""
    }

    fight(){
        throw new Error("Mov wasnt specified")
    }

    canFly(){
        if(!this.tipo){
            throw new Error("Type wasnt specified")
        }
        else return this.tipo.includes("flying")
    }
}

class Charizard extends Pokemon{
    constructor(hp, ataque, defensa, movimiento){
        super(hp,ataque,defensa)
        this.movimiento = movimiento
        this.tipo = "flying"
    }

    fight(){
        if(this.movimiento){
            console.log(`Charizard is using a movement: ${this.movimiento}`)
            return this.movimiento
        }
        else throw new Error("Movement wasnt specified")
    }
}