module Level.LeveUtils;

import std;

void loadFile(string filename) {

}

void saveFile(string filename) {

}

void setTile(short x, short y, short z, ubyte type) {

}

short[] getCoordinates(short x, short y, short z) {
    short[] index;
    return index;
}


ubyte[] compileClassicLevel(ubyte[] blocks) {

    ubyte[] uncompressedPayload;
    uncompressedPayload.reserve(4 + blocks.length);

    int totalBlocks = cast(int)blocks.length;
    uncompressedPayload ~= nativeToBigEndian(totalBlocks);

    uncompressedPayload ~= blocks;

    auto compressor = new Compress(HeaderFormat.gzip);
    ubyte[] compressedPayload = cast(ubyte[])compressor.compress(uncompressedPayload);

    compressedPayload ~= cast(ubyte[])compressor.flush();

    return compressedPayload;
}

