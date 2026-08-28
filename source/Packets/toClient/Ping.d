module Packets.toClient.Ping;
import Packets.Packet;
import std.array : Appender;
class Ping : Packet {
   immutable ubyte packetID = 0x01;

   this() {}

   ubyte[] serialize() {
       Appender!(ubyte[]) data;
       data.put(packetID);
       return data.data;
   }
}