// Conditions Builder
import crafttweaker.api.loot.conditions.LootConditionBuilder;
import crafttweaker.api.loot.conditions.vanilla.LootTableId;
// Modifier
import crafttweaker.api.loot.modifiers.CommonLootModifiers;

var modifiedPigTrade = LootConditionBuilder.create().add<LootTableId>(condition => {
        condition.withTableId(<resource:minecraft:gameplay/piglin_bartering>);
    });


loot.modifiers.register("modify_piglin_trade", modifiedPigTrade, CommonLootModifiers.removeAll(<item:minecraft:iron_boots>, <item:minecraft:iron_nugget>, <item:minecraft:string>, <item:minecraft:quartz>, <item:minecraft:leather>));