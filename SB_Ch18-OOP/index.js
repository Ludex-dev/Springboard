//  Part One
class Vehicle {
    constructor(brand, model, year) {
        this.brand = brand;
        this.model = model;
        this.year = year;
    }

    toString() {
        return console.log(`This is a ${this.brand} ${this.model} from ${this.year}`)
    }

    honk() {
        return console.log(`Beep!`)
    }
}

let myFirstVehicle = new Vehicle("Honda", "Monster Truck", 1999);
// myFirstVehicle.honk(); 
// myFirstVehicle.toString(); 


// Part Two
class Car extends Vehicle {
    constructor(brand, model, year) {
        super(brand, model, year)

    }
    numWheels = 4; // Is there a better way to implement
    // numWheels() {
    //     return console.log(`4`)
    // }

}

let myFirstCar = new Car('Toyota', 'Corolla', 2005)
// myFirstCar.toString(); // "The vehicle is a Toyota Corolla from 2005."
// myFirstCar.honk();     
// console.log(myFirstCar.numWheels); 

// Part three
class Motorcycle extends Vehicle {
    constructor(brand, model, year) {
        super(brand, model, year)

    }


    revEngine() {
        return console.log(`VROOM!!!`)
    }

    numWheels = 2;
}

let myFirstMotorcycle = new Motorcycle("Honda", "Nighthawk", 2000)
// myFirstMotorcycle.toString();
// myFirstMotorcycle.honk();    
// myFirstMotorcycle.revEngine(); 
// console.log(myFirstMotorcycle.numWheels); 


class Garage {
    constructor(capacity) {
        this.capacity = capacity
        this.vehicles = []
    }
    add(vehType) {
        if ((vehType instanceof Car || vehType instanceof Motorcycle)) {
            if (this.vehicles.length >= this.capacity) {
                return console.log(`Sorry, we're full.`);
            } else {
                this.vehicles.push(vehType.constructor.name)
                return console.log(`Vehicle added!`);
            }
        } else {
            return `Only vehicles are allowed in here!`;
        }

        // } else if (vehType === undefined || !(vehType instanceof Car || vehType instanceof Motorcycle)) {
        //     return `Only vehicles are allowed in here!`;
        // } else {
        //     this.vehicles.push(vehType.constructor.name)
        //     return `Vehicle added!`;
        // }
    }
}

let garage = new Garage(2);

console.log(garage.vehicles)
garage.add(new Car("Hyundai", "Elantra", 2015));
console.log(garage.vehicles)

console.log(garage.add("Taco"))

garage.add(new Motorcycle("Honda", "Nighthawk", 2000));
console.log(garage.vehicles)
garage.add(new Motorcycle("Honda", "Nighthawk", 2001));































class Example {
    constructor(arg1, arg2) {
        this.arg1 = arg1;
        this.arg2 = arg2;
        this.callback;
    }

    callback() {
        return console.log(`Return of ${this.arg1} & ${this.arg2}`)
    }

}

new Example('A', 'B')

