module Level.Initialize;

import std;
struct ClassicWorld {
    ushort w = 512;
    ushort h = 64;
    ushort d = 512;

    ubyte[] blocks;

    ubyte[] serializeForSending() {

        auto rawData = appender!(ubyte[]);

        rawData.put(nativeToBigEndian!int(0x271bb)[]);
        rawData.put(nativeToBigEndian!ushort(w)[]);
        rawData.put(nativeToBigEndian!ushort(h)[]);
        rawData.put(nativeToBigEndian!ushort(d)[]);
        rawData.put(blocks);

        return cast(ubyte[]) compress(rawData.data);
    }


    void saveToFile(string filename) {

        try {

            std.file.write(filename, serializeForSending);
            writeln("file created and saving");
        } catch (Exception e) {
            writeln("an error occurred when saving:");
            writeln(e.msg);
        }
    }

    ubyte[] loadFromFile(string filename) {

        ubyte[] data;
        try {
            data = cast(ubyte[]) read(filename);
            writeln("sucessfully read");
        } catch (Exception e) {
            writeln("an error occured while reading");
            writeln(e.msg);

        }

        return data;
    }

}