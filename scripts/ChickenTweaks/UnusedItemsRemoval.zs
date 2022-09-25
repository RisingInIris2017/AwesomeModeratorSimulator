import crafttweaker.api.item.IItemStack;

val unusedChickensItems as IItemStack[] =  [
    <item:chickens:oak_chicken_bait>, 
    <item:chickens:sand_chicken_bait>, 
    <item:chickens:flint_chicken_bait>, 
    <item:chickens:quartz_chicken_bait>, 
    <item:chickens:soul_sand_chicken_bait>, 
    <item:chickens:roost>, 
    <item:chickens:breeder>, 
    <item:chickens:collector>
]; 

for item in unusedChickensItems {
    craftingTable.removeRecipe(item);
    mods.jei.JEI.hideItem(item);
}