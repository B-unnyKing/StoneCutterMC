module Packets.Packet;

import std;
import std.array : Appender;



class Packet {
    protected static void appendBigEndian(T)(ref Appender!(ubyte[]) data, T value) if (isIntegral!T) {
        data.put(nativeToBigEndian(value)[]);
    }

    protected static void appendFixedString(ref Appender!(ubyte[]) data, string value, size_t targetLen = 64) {
        auto bytes = cast(const(ubyte)[]) value;
        size_t copyLen = bytes.length < targetLen ? bytes.length : targetLen;

        data.put(bytes[0 .. copyLen]);
        if (copyLen < targetLen) {
            size_t remaining = targetLen - copyLen;
            ubyte[] padding;
            padding.length = remaining;
            padding[] = ' ';
            data.put(padding);
        }
    }
}
