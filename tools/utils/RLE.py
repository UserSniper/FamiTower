#RLE compressor, written by alexmush for the Pokemon-esque format
import math, os, sys
from contextlib import contextmanager
import numpy as np

@contextmanager
def disable_exception_traceback():
    """
    All traceback information is suppressed and only the exception type and value are printed
    """
    default_value = getattr(sys, "tracebacklimit", 1000)  # `1000` is Python's default value
    sys.tracebacklimit = 0
    yield
    sys.tracebacklimit = default_value  # revert changes

def MSB_mask(num):
    for i in range(15, -1, -1):
        if num >= 1<<i:
            return 1<<i
    return 0

def num_length(num):
    for i in range(15, -1, -1):
        if num >= 1<<i:
            return i+1
    return 0

def RLE_encode(data):
    bit_pairs = np.zeros(64, np.uint8)
    new_bits = np.zeros(128, np.uint8) # if it exceeds 128 (settings) bits, there is no point
    for i in range(16):
        bit_pairs[i*4] = (data[i] & 0xC0) >> 6
        bit_pairs[i*4+1] = (data[i] & 0x30) >> 4
        bit_pairs[i*4+2] = (data[i] & 0x0C) >> 2
        bit_pairs[i*4+3] = (data[i] & 0x03)
    currentPacketType = 0 if bit_pairs[0] == 0 else 1
    zeroPacketLength = 0
    bit_index = 2
    new_bits[1] = currentPacketType
    if DEBUG and QUIET:
        print(f"Starting with {currentPacketType}")
    for i in range(len(bit_pairs)):
        if bit_index >= 128:
            return [False]
        if not currentPacketType:
            zeroPacketLength += 1
            if DEBUG and QUIET:
                print(f"{i}: Packet type 00, length {zeroPacketLength}")
            if bit_pairs[i] != 0:
                #write out zero packet length
                zpll = num_length(zeroPacketLength)-1
                zeroPacketLength &= ~MSB_mask(zeroPacketLength)
                if DEBUG and QUIET:
                    print (f"{i}: Which ends here at length {zeroPacketLength:0{zpll}b}")
                if bit_index+zpll+zpll >= 128:
                    return [False]
                for j in range(zpll-1):
                    new_bits[bit_index+j] = 1
                bit_index += zpll
                for j in range(zpll):
                    new_bits[bit_index+(zpll-j-1)] = (zeroPacketLength>>j)&1
                bit_index += zpll
                if DEBUG and QUIET:
                    np.set_printoptions(formatter={'int':lambda x:f"{x:01b}"})
                    print(f"Wrote out bits {new_bits[bit_index-zpll-zpll:bit_index]}")
                    np.set_printoptions(formatter={'int':lambda x:f"{x:08b}"})
                currentPacketType = 1
                if bit_index >= 128:
                    return [False]
                if DEBUG and QUIET:
                    print(f"{i}: Packet type data")
                new_bits[bit_index+1] = bit_pairs[i] & 1
                new_bits[bit_index] = (bit_pairs[i] >> 1) & 1
                if DEBUG and QUIET:
                    print(f"Wrote bits {new_bits[bit_index]<<1 | new_bits[bit_index+1]:02b}")
                bit_index += 2
        else:
            if DEBUG and QUIET:
                print(f"{i}: Packet type data")
            new_bits[bit_index+1] = bit_pairs[i] & 1
            new_bits[bit_index] = (bit_pairs[i] >> 1) & 1
            if DEBUG and QUIET:
                print(f"Wrote bits {new_bits[bit_index]<<1 | new_bits[bit_index+1]:02b}")
            if bit_pairs[i] == 0:
                currentPacketType = 0
                zeroPacketLength = 1
            bit_index += 2
    #final
    if bit_index >= 128:
        return [False]
    if not currentPacketType:
        zeroPacketLength += 1
        if DEBUG and QUIET:
            print(f"It ends on packet type 00 with length {zeroPacketLength}")
        #write out zero packet length
        zpll = num_length(zeroPacketLength)-1
        zeroPacketLength &= ~MSB_mask(zeroPacketLength)
        if bit_index+zpll+zpll >= 128:
            return [False]
        for j in range(zpll-1):
            new_bits[bit_index+j] = 1
        bit_index += zpll
        for j in range(zpll):
            new_bits[bit_index+(zpll-j-1)] = (zeroPacketLength>>j)&1
        bit_index += zpll
        currentPacketType = 1
        zeroPacketLength = 1
    else:
        if DEBUG and QUIET:
            print(f"It ends on packet type data")
        new_bits[bit_index+1] = 0
        new_bits[bit_index] = 0
    out_bits = np.zeros(16, np.uint8)
    for i in range(len(out_bits)):
        out_bits[i] = new_bits[i*8]<<7 | new_bits[i*8+1]<<6 | new_bits[i*8+2]<<5 | new_bits[i*8+3]<<4 | new_bits[i*8+4]<<3 | new_bits[i*8+5]<<2 | new_bits[i*8+6]<<1 | new_bits[i*8+7]
    if (math.ceil(bit_index/8) == 16):
        return [False]
    return (True, out_bits, math.ceil(bit_index/8))

def delta_encode(data):
    #decompress data
    new_bits = np.zeros(128, np.uint8)
    for i in range(len(data)):
        new_bits[i*8] = ((data[i]>>7) & 1)
        new_bits[i*8+1] = ((data[i]>>6) & 1)
        new_bits[i*8+2] = ((data[i]>>5) & 1) 
        new_bits[i*8+3] = ((data[i]>>4) & 1)
        new_bits[i*8+4] = ((data[i]>>3) & 1) 
        new_bits[i*8+5] = ((data[i]>>2) & 1)
        new_bits[i*8+6] = ((data[i]>>1) & 1)
        new_bits[i*8+7] = (data[i] & 1)
    last_bit = 0
    for i in range(len(new_bits)):
        new_bits[i] ^= last_bit
        last_bit ^= new_bits[i]
    out_bits = np.zeros(16, np.uint8)
    for i in range(len(out_bits)):
        out_bits[i] = new_bits[i*8]<<7 | new_bits[i*8+1]<<6 | new_bits[i*8+2]<<5 | new_bits[i*8+3]<<4 | new_bits[i*8+4]<<3 | new_bits[i*8+5]<<2 | new_bits[i*8+6]<<1 | new_bits[i*8+7]
    return out_bits

                

if __name__ == '__main__':
    total_sum = 1
    amount_of_delta = 0
    amount_of_raw = 0

    DELTA = not "-no-delta" in sys.argv
    DEBUG = "-d" in sys.argv
    VERBOSE = "-v" in sys.argv
    SILENT = not "-s" in sys.argv
    QUIET = not "-q" in sys.argv and SILENT  #-s implies -q
    PRINTRAW = "-print-raw" in sys.argv
    FORMAT = not "-bin-debug" in sys.argv
    np.set_printoptions(formatter={'int':lambda x:f"${x:02x}"} if FORMAT else {'int':lambda x:f"{x:08b}"})
    if "-i" in sys.argv and len(sys.argv) > sys.argv.index("-i")+1 and sys.argv[sys.argv.index("-i")+1][0] != "-" and os.path.exists(sys.argv[sys.argv.index("-i")+1]):
        infile = sys.argv[sys.argv.index("-i")+1]
    else:
        infile = input("Type in the file that needs to be compressed: ")
    if not os.path.exists(infile):
        with disable_exception_traceback():
            raise FileNotFoundError("Hey m8 that file ("+str(os.path.abspath(infile))+") doesn't exist")
    input_array = np.fromfile(infile, np.uint8)

    if "-l" in sys.argv and len(sys.argv) > sys.argv.index("-l")+1 and sys.argv[sys.argv.index("-l")+1].isnumeric() and int(sys.argv[sys.argv.index("-l")+1]) <= input_array.shape[0]>>4:
        length = int(sys.argv[sys.argv.index("-l")+1])
    else:
        length = input_array.shape[0]>>4 
    amount_of_flags = (math.ceil(length/8))

    if "-o" in sys.argv and len(sys.argv) > sys.argv.index("-o")+1 and sys.argv[sys.argv.index("-o")+1][0] != "-":
        OUTPUT = True
        output_file = open(sys.argv[sys.argv.index("-o")+1], "wb")
    elif "-o" in sys.argv and (len(sys.argv) > sys.argv.index("-o")+1 and sys.argv[sys.argv.index("-o")+1][0] == "-" or len(sys.argv) == sys.argv.index("-o")+1):
        OUTPUT = True
        output_file = open("".join(os.path.splitext(infile)[0:-1])+".rle", "wb")
    else:
        OUTPUT = False

    if OUTPUT:
        output_file.write(np.array([length], np.uint8))

    for h in range(amount_of_flags):
        if OUTPUT:
            output_array = np.array([0xFF], np.uint8)
        for i in range(min(length-h*8, 8)):
            stuff = RLE_encode(input_array[h*128+i*16:h*128+i*16+16])
            if DELTA:
                delta_stuff = RLE_encode(delta_encode(input_array[h*128+i*16:h*128+i*16+16]))
            #get the better stuff
            if DELTA and stuff[0] and delta_stuff[0]:
                total_sum += min(stuff[2], delta_stuff[2])
                if stuff[2] <= delta_stuff[2]:
                    if QUIET:
                        print(f"Tile {h*8+i} compressed"+(" - "+str(stuff[1][0:stuff[2]]) if VERBOSE else "")+" - length "+str(stuff[2]))    
                    if OUTPUT:
                        output_array = np.append(output_array,stuff[1][0:stuff[2]])
                else:
                    delta_stuff[1][0] |= 0x80
                    if QUIET:
                        print(f"Tile {h*8+i} compressed"+(" - "+str(delta_stuff[1][0:delta_stuff[2]]) if VERBOSE else "")+" with delta encoding - length "+str(delta_stuff[2]))
                        if PRINTRAW:
                            print(f"Delta data: {delta_encode(input_array[h*128+i*16:h*128+i*16+16])}")
                    if OUTPUT:
                        output_array = np.append(output_array,delta_stuff[1][0:delta_stuff[2]])
                    amount_of_delta += 1
            elif stuff[0]:
                if QUIET:
                    print(f"Tile {h*8+i} compressed"+(" - "+str(stuff[1][0:stuff[2]]) if VERBOSE else "")+" - length "+str(stuff[2]))
                if OUTPUT:
                    output_array = np.append(output_array,stuff[1][0:stuff[2]])
            elif DELTA and delta_stuff[0]:
                delta_stuff[1][0] |= 0x80
                if QUIET:
                    print(f"Tile {h*8+i} compressed"+(" - "+str(delta_stuff[1][0:delta_stuff[2]]) if VERBOSE else "")+" with delta encoding - length "+str(delta_stuff[2]))
                    if PRINTRAW:
                        print(f"Delta data: {delta_encode(input_array[h*128+i*16:h*128+i*16+16])}")
                if OUTPUT:
                    output_array = np.append(output_array,delta_stuff[1][0:delta_stuff[2]])
                amount_of_delta += 1
            else:
                total_sum += 16
                amount_of_raw += 1
                if QUIET:
                    print(f"Tile {h*8+i} did not compress")
                if OUTPUT:
                    output_array = np.append(output_array,input_array[h*128+i*16:h*128+i*16+16])
                    output_array[0] ^= (1 << (i ^ 7))
            if PRINTRAW:
                print(f"Raw data:   {input_array[h*128+i*16:h*128+i*16+16]}")
        if OUTPUT:
            output_file.write(output_array)
    total_sum += amount_of_flags
    if SILENT:
        print(f"Total compressed size is {total_sum}, resulting in {((length*16)-total_sum)/(length*16)*100}% compression, with {amount_of_delta} tiles being delta encoded and {amount_of_raw} not compressed at all out of the total {length}.")
    if OUTPUT:
        output_file.close()

