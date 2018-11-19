FARM_DEBUG = false;
FARM_DEBUG_AI = false;

FARM_VAR_sideAlly = west;
FARM_VAR_sideHostile = east;
FARM_VAR_sideNeutral = resistance;

FARM_VAR_sideAlly setFriend [FARM_VAR_sideHostile, 0];
FARM_VAR_sideAlly setFriend [FARM_VAR_sideNeutral, 0.6];
FARM_VAR_sideAlly setFriend [civilian, 1];

FARM_VAR_sideHostile setFriend [FARM_VAR_sideAlly, 0];
FARM_VAR_sideHostile setFriend [FARM_VAR_sideNeutral, 0.6];
FARM_VAR_sideHostile setFriend [civilian, 0];

FARM_VAR_sideNeutral setFriend [FARM_VAR_sideAlly, 0.6];
FARM_VAR_sideNeutral setFriend [FARM_VAR_sideHostile, 0.6];
FARM_VAR_sideNeutral setFriend [civilian, 0.6];

// Civilians by default set to friend towards all sides

FARM_permit_civ = ["Driving", "Adv. Driving", "Pilot", "Helicopter", "Small Arms", "Handguns", "Hunting (Rifle)", "Machine Gun", "Diving", "Taxi"];
FARM_permit_mil = ["Automatic Weapons", "Heavy Arms", "Ordinance & Explosives", "Tracked Vehicles", "Drones", "Jet Planes"];

FARM_occupations = ["Unemployed", "Retired", "Student", "Taxi Driver", "Factory Worker", "Farmer", "Miner", "Tree Surgeon", "Plantation Worker", "Plumber", "Builder", "Barman", "Salesman", "Handyman", "Landlord", "Personal Trainer", "Cleaner", "Waste Operative", "Caretaker", "Teacher", "P.I.", "Nurse", "Doctor", "Librarian", "Servant", "Masseur", "Postman", "Singer", "Courier", "Barber", "Chef", "Firefigher", "Volunteer Aid Worker", "Electrician", "Mechanic", "Engineer", "Pilot", "Security Guard", "Waiter", "Locksmith", "Dancer", "Actor", "Journalist", "Clerk", "Bounty Hunter"];

FARM_crime_petty = ["Theft", "Public Indecency", "Breach of the Peace"];
FARM_crime_small = ["Mugging", "Fraud", "Sexual Harassment"];
FARM_crime_medium = ["Armed Robbery", "Burglary", "Identity Theft", "Rape"];
FARM_crime_large = ["Murder", "GBH", "Assault"];

FARM_items_common = ["Cash (Notes)", "Wallet", "Purse", "Book", "Notepad", "Water Bottle", "Phone", "Keys"];
FARM_items_sus = ["Cash (Large Wad)", "Hatchet", "Machete", "Knife", "Lighter", "Acid"];
FARM_items_naughty = ["Explosives", "MDMA - Bag", "Unknown white powder", "Cocaine", "Crack Cocaine", "Weed - Bag", "Ketamine", "Crystal Meth", "Heroin", "Weed - Hash", "Acid Tabs", "Unknown Mushrooms", "Spice"];