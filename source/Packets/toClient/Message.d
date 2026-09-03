module Packets.toClient.Message;
import Packets.Packet;
import std.array : Appender;
class Message : Packet {
    immutable ubyte packetID = 0x0d;
    byte playerID;
    string message;

    this(byte playerID, string message) {
        this.playerID = playerID;
        this.message = message;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, playerID);
        appendFixedString(data, message);
        return data.data;
    }
}