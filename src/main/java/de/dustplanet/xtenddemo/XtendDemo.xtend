package de.dustplanet.xtenddemo

import org.bukkit.ChatColor
import org.bukkit.command.Command
import org.bukkit.command.CommandSender
import org.bukkit.entity.Player
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.player.PlayerJoinEvent
import org.bukkit.plugin.java.JavaPlugin

class XtendDemo extends JavaPlugin implements Listener {

    override onEnable() {
        server.pluginManager.registerEvents(this, this)
        getCommand("xtend") => [executor = this]
    }

    @EventHandler
    def onPlayerJoin(PlayerJoinEvent e) {
        greetPlayer(e.player, ChatColor.RED)
    }

    def greetPlayer(Player player, ChatColor color) {
        player.sendMessage(color + '''You have been greeted by Xtend in «color.name.toLowerCase»!''')
    }

    override onCommand(CommandSender sender, Command command, String commandLabel, String[] args) {
        server.onlinePlayers.forEach[
            greetPlayer(ChatColor.GREEN)
        ]
        return true;
    }
}