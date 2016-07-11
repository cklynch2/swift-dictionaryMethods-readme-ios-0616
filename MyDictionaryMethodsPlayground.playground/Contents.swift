//: Playground - noun: a place where people can play

let downtownParks = ["Battery Park",
                     "Washington Square Park",
                     "Tompkins Square Park"]

let uptownParks = ["Riverside Park",
                   "Central Park",
                   "Madison Square Park"]

let brooklynParks = ["Prospect Park",
                     "McCarren Park",
                     "Fort Greene Park"]

let queensParks = ["Gantry Park",
                   "Socrates Park",
                   "Queensbridge Park"]

var parksOfNewYorkCity = ["Downtown" : downtownParks,
                          "Uptown" : uptownParks,
                          "Brooklyn" : brooklynParks]

// You can use either subscript syntax OR updateValue: forKey: method to add a new entry to the dictionary. The method returns a optional, which is the previous value if the key already existed in the dictionary and nil if the key did not already exist.
parksOfNewYorkCity["Queens"] = ["Test", "Bloop", "Bleep"]
print(parksOfNewYorkCity)

let queensParksBefore = parksOfNewYorkCity.updateValue(queensParks, forKey: "Queens")
print(queensParksBefore)

// Accessing a dictionary value through its key will return an optional. This is to account for the case of the key not existing in the dictionary, which will return nil:
print(parksOfNewYorkCity["Queens"])
print(parksOfNewYorkCity["Bronx"])

// You cannot modify dictionary values (in this case, using [String] methods) with the method call directly on subscript syntax, because subscripting returns an optional and you have to 'unwrap' its value first to utilize those method calls.
// Example: parksOfNewYorkCity["Downtown"].append("Union Square") will NOT work.

if var parks = parksOfNewYorkCity["Downtown"] {
    parks.append("Union Square") // The parks array is a COPY of the downtownParks array in the dictionary.
    
    parksOfNewYorkCity["Downtown"] = parks // You have to reassign the key to its new value in order to update the array in the dictionary.
}
// Confirming that Union Square added..
print(parksOfNewYorkCity)

// Removing key-value pair from a dictionary:
parksOfNewYorkCity["Uptown"] = nil

if let uptownParks = parksOfNewYorkCity["Uptown"] {
    print("These are some parks in uptown Manhattan: \(uptownParks).")
} else {
    print("I don't want to go all the way uptown.")
}

// If you want to capture the value that you're removing, however, you can do so by instead using the removeValueForKey method. Again, if the key does exist in the dictionary, this will return an optional, and if the key does not exist, it will return nil.
let saveQueensParks = parksOfNewYorkCity.removeValueForKey("Queens")
print(saveQueensParks)

let uptownParksAlreadyRemoved = parksOfNewYorkCity.removeValueForKey("Uptown")
print(uptownParksAlreadyRemoved) // nil

// Checking to see if a dictionary is empty and, if not, how many entries it has:
if parksOfNewYorkCity.isEmpty {
    print("So sad, no green space!")
} else {
    print("There are many parks across all \(parksOfNewYorkCity.count) boroughs.")
}

// Accessing array of keys:
for borough in parksOfNewYorkCity.keys {
    print("\(borough) is represented in the dictionary. Uh oh! We are missing some boroughs...")
}

// Retrieving all values:
let allTheParks = Array(parksOfNewYorkCity.values)
print(allTheParks)