module Packets.toServer.PlayerMessage;
import Packets.Packet;
import std;
import std.array : Appender;
class PlayerMessage : Packet {
    immutable ubyte packetID = 0x08;
    byte playerID;
    string message;

    this(byte playerID, string message) {
        this.playerID = playerID;
        this.message = message;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;

        data.put(packetID);
        data.put(playerID);
        appendFixedString(data, message);
        return data.data;
    }
}