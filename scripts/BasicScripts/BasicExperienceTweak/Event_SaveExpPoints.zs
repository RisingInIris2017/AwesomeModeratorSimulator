import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.living.MCLivingDeathEvent;
import crafttweaker.api.event.entity.player.MCPlayerRespawnEvent;

import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;

import math.Functions;

val restoreRatio = 0.8f;

// Save player's exp points
CTEventManager.register<MCLivingDeathEvent>((event) => {
    if (event.entityLiving.world.remote) return;
    if (event.entityLiving is MCPlayerEntity) {
        var player as MCPlayerEntity = event.entityLiving as MCPlayerEntity;
        var expPoints = player.experienceTotal;
        player.updatePersistentData({ExpPointsBeforeDeath: expPoints});
        player.sendMessage("\u5F53\u524D\u79EF\u5206: " + expPoints);
    }
});

// Restore it for respawned player
CTEventManager.register<MCPlayerRespawnEvent>((event) => {
    var world = event.entityLiving.world;
    if (world.remote) return;
    if (event.endConquered) return;
    var player = event.player;
    var playerForgeData as MapData = player.getPersistentData();
    if (!(playerForgeData.contains("PlayerPersisted"))) {
        return;
    } else {
        var expPoints as IData? = playerForgeData.getData<MapData>("PlayerPersisted").getAt("ExpPointsBeforeDeath");
        if (expPoints == null) return;
        var expPointsToRestore = Functions.floor(restoreRatio * expPoints.asNumber().getInt()) as int;
        world.asServerWorld().server.executeCommand("xp add " + player.name + " " + expPointsToRestore + " points", true);
        player.sendMessage("\u5DF2\u6062\u590D\u90E8\u5206\u79EF\u5206\u3002\u5F53\u524D\u79EF\u5206: " + expPointsToRestore);
    }
});
