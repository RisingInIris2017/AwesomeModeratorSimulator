import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.MCEntityJoinWorldEvent;
import crafttweaker.api.event.entity.player.interact.MCEntityInteractEvent;

// Disallow traders and (zombie) villagers to spawn
CTEventManager.register<MCEntityJoinWorldEvent>((event) => {
    var entityCommandString = event.entity.type.commandString;
    if (entityCommandString.indexOf("villager") != null || entityCommandString.indexOf("wandering_trader") != null) {event.cancel();}
});

// Remove interactions to them
CTEventManager.register<MCEntityInteractEvent>((event) => {
    var entityCommandString = event.target.type.commandString;
    if (entityCommandString.indexOf("villager") != null || entityCommandString.indexOf("wandering_trader") != null) {event.cancel();}
});