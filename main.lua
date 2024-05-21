---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule('Categories')

-- Localization table
local locales = {
    ["enUS"] = {
        ["Battle Pet"] = "Battle Pet",
    },
    ["frFR"] = {
        ["Battle Pet"] = "Mascottes de combat",
    }
}

-- Detects current language
local currentLocale = GetLocale()

-- Function to get the translation
local function L(key)
    return locales[currentLocale] and locales[currentLocale][key] or locales["enUS"][key]
end

-- List comes from @LownIgnitus
-- https://www.curseforge.com/wow/addons/adibags-battle-pet-items

--Miscellaneous Items
local MiscellaneousItems = {
	37431, --Fetch Ball
	43352, --Pet Grooming Kit
	43626, --Happy Pet Snack
	71153, --Magical Pet Biscuit
	86143, --Battle Bandage
	89906, --Magical Mini-Treat
	98112, --Lesser Pet Treat
	98114, --Pet Treat
	163697, --Laser Pointer
	139003, --Pocket Pet Portal
	139036, --Ominous Pet Treat
	163789, -- Bundle of Wiker Sticks
	163790, -- Spooky Incantation
	163791, -- Minature Stag Skull
	163796, -- Wolf Pup Spine
	165840, -- Interdimentional Pet Portal
	166732, -- Bludgeoning-Resistant Chest Reinforcer
	166733, -- Steel-Plated Primate Exoskeleton
	166734, -- Banana-Shaped Power Cell
	166735, -- Mecha-Spinneret
	166737, -- Handful of Glass Spider Eyes
	166738, -- Steel-Plated Arachnid Exoskeleton
	183111, --Animated Ulna
	183112, --Animated Radius
	183113, --Flexing Phalanges
}

--Currency Items
local CurrencyItems = { 
	101529, --Celestial Coin
	116415, --Shiney Pet Charm
	151191, --Old Bottle Cap
	163036, --Polished Pet Charm
	165835, -- Pristine Gizmo
	169665, -- Cleansed Remains
	174360, -- Shadowy Gem
}

--Battle Pet Containing Items
local BattlePetContainingItems = {
	21310, --Gaily Wrapped Present
	39878, --Mysterious Egg
	112107, --Mysterious Egg
	137599, --Pulsating Sac
	137608, --Growling Sack
	153190, --Fel Spotted Egg
	153191, --Cracked Fel-Spotted Egg
	182607, --Hairy Egg
}

--Supplies Bags
local SuppliesBags = {
	89125, --Sack of Pet Supplies
	94207, --Fabled Pandaren Pet Supplies
	93146, --Pandaren Burning Spirit Pet Supplies
	93147, --Pandaren Flowing Spirit Pet Supplies
	93148, --Pandaren Whispering Spirit Pet Supplies
	93149, --Pandaren Thundering Spirit Pet Supplies
	91086, --Darkmoon Pet Supplies
	98095, --Brawler's Pet Supplies
	116062, --Greater Darkmoon Pet Supplies
	118697, --Big Bag of Pet Supplies
	122535, --Traveler's Pet Supplies
	127751, --Fel-Touched Pet Supplies
	120321, --Mystery Bag
	116202, --Pet Care Package
	142447, --Torn Sack of Pet Supplies
	143753, --Damp Pet Supplies
	146317, --Mr. Smite's Supplies
	151638, --Leprous Sack of Pet Supplies
}

--Rare Stones
local RareStones = {
	92741, --Flawless Battle-Stone
	92679, --Flawless Aquatic Battle-Stone
	92675, --Flawless Beast Battle-Stone
	92676, --Flawless Critter Battle-Stone
	92683, --Flawless DragonkinBattle-Stone
	92665, --Flawless Elemental Battle-Stone
	92677, --Flawless Flying Battle-Stone
	92682, --Flawless Humanoid Battle-Stone
	92678, --Flawless Magic Battle-Stone
	92680, --Flawless Mechanical Battle-Stone
	92681, --Flawless Undead Battle-Stone
	92742, --Polished Battle-Stone
	98715, --Marked Flawless Battle-Stone
}

--Level Stones
local LevelStones = {
	116374, --Beast Battle-Training Stone
	116416, --Humanoid Battle-Training Stone
	116417, --Mechanical Battle-Training Stone
	116418, --Critter Battle Training Stone
	116419, --Dragonkin Gattle-Training Stone
	116420, --Elemental Battle-Training Stone
	116421, --Flying Battle-Training Stone
	116422, --Magic Battle-Training Stone
	116423, --Undead Battle-Training Stone
	116424, --Aquatic Battle-Training Stone
	116429, --Flawless Battle-Training Stone
	122457, --Ultimate Battle-Training Stone
	127755, --Fel-Touched Battle-Training Stone
}

--Battle Pet Toys
local BattlePetToys = {
	44820, --Red Ribbon Pet Leash
	37460, --Rope Pet Leash
	89139, --Chain Pet Leash
	127707, --Indestructible Bone
	127695, --Spirit Wand
	127696, --Magic Pet Mirror
	129958, --Leather Pet Leash
	129961, --Flaming Hoop
	140231, --Narcissa's Mirror
	163205, --Ghostly Pet Biscuit
	163704, --Tiny Mechanical Mouse
	163705, --Imaginary Gun
	174925, --Void Tendril Pet Leash
}

--Costume Items
local CostumeItems = {
	103786, --"Dapper Gentleman" Costume
	103789, --"Little Princess" Costume
	103795, --"Dread Pirate" Costume
	103797, --Big Pink Bow
	116172, --Perky Blaster
	116810, --"Mad Alchemist" Costume
	116811, --"Lil' Starlet" Costume
	116812, --"Yipp-Saron" Costume
	128650, --"Merry Munchkin" Costume
}

local allItems = {
    MiscellaneousItems,
    CurrencyItems,
    BattlePetContainingItems,
    SuppliesBags,
    RareStones,
    LevelStones,
    BattlePetToys,
    CostumeItems
}

--Delete category before adding translations
categories:DeleteCategory("Battle Pet") 

--Wipe category too ensure the items list is up to date
categories:WipeCategory(L("Battle Pet"))

--Loop
for _, itemList in pairs(allItems) do
    for _, ItemID in pairs(itemList) do
		categories:AddItemToCategory(ItemID, L("Battle Pet"))
    end
end
