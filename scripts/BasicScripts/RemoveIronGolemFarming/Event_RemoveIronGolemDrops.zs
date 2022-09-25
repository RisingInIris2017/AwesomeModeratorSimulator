import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.living.MCLivingDropsEvent;

// Disallow all Iron Golems to drop items
CTEventManager.register<MCLivingDropsEvent>((event) => {
    var entityCommandString = event.entity.type.commandString;
    if (entityCommandString.indexOf("iron_golem") != null) {event.cancel();}
});