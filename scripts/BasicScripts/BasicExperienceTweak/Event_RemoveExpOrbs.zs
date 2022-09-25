import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.MCEntityJoinWorldEvent;

// Disallow traders and (zombie) villagers to spawn
CTEventManager.register<MCEntityJoinWorldEvent>((event) => {
    var entityCommandString = event.entity.type.commandString;
    if (entityCommandString.indexOf("experience_orb") != null) {event.cancel();}
});