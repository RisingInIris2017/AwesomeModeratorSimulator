import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.MCEntityJoinWorldEvent;

import crafttweaker.api.data.IData;

// Disallow non-player-generated Iron Golems to spawn
CTEventManager.register<MCEntityJoinWorldEvent>((event) => {
    var entity = event.entity;
    // We must do this.
    // If not, remote can not get the PlayerCreated mark, then cancel the event wrongly.
    if (entity.world.remote) return;
    
    var entityCommandString = entity.type.commandString;
    if (entityCommandString.indexOf("iron_golem") != null) {
        var playerCreated as IData? = entity.data.getAt("PlayerCreated");
        if (playerCreated == null) {event.cancel(); return;}
        var playerCreateBoolean as bool = playerCreated.asBoolean();
        if (!playerCreateBoolean) {event.cancel(); return;}
    }
});